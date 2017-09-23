<?php
namespace Point\Controller;
use \Common\Controller\CommonController;

class IndexController extends CommonController {
    public function index(){
        $dcenterIP = C("DCENTER_IP");
        $dcenterPort = C("DCENTER_PORT");
        $url = "http://{$dcenterIP}:{$dcenterPort}/";

        $urls = array(
            array(
                'name'=>"得到设备的组态信息",
                'url'=> "{$url}bh5000/25025"
            ),
            array(
                'name'=>"得到测点的组态信息",
                'url'=> "{$url}bh5000/25003"
            ),
            array(
                'name'=>"设备报警状态实时数据",
                'url'=> "{$url}bh5000/20025"
            ),
            array(
                'name'=>"测点的实时状态信息",
                'url'=> "{$url}bh5000/20026"
            )
        );

        foreach($urls as $url) {
            echo "<a href='{$url['url']}' target='_blank'>{$url['name']}: {$url['url']}</a>";
            echo '<br/>';
        }
    }
    public function syncPoint(){
        $plantController = A('Plant/Index');

        // 获得所有设备
        $result = $plantController->getPlants(false);

        $plants = array();
        if( !( $result['code'] == 200 && is_array($result['data']) ) ) {
            echoResult("没有获得设备信息！", $result['code']);
        }else {
            $plants = $result['data'];
        }

        foreach($plants as $plant) {
            $equipmentName = $plant['equipmentName'];
            if($equipmentName != "设备18"){
                continue;
            }

            // 获取设备所有测点
            $result = $this->getPoints($plant['equipmentUuid'], false);
            $points = array();
            if( !( $result['code'] == 200 && is_array($result['data']) ) ) {
                echoResult("没有获得设备信息！", $result['code']);
            }else {
                $points = $result['data'];
            }
            $points = $this->sortPoints($points);
            $pointData = $this->processingPoints($points);

            $this->syncVibrationPoints($plant, $pointData);
            $this->syncProcessPoints($plant, $pointData);
        }
    }


    private function syncVibrationPoints($plant, $pointData){
        if(!is_array($pointData['vibrator'])) {
            return false;
        }
        $data = array();
        $isAdd = true;
        foreach($pointData['vibrator'] as $index=>$val) {
            if($val === null) {
                $isAdd = true;
            }else {
                if($isAdd) {
                    $data[] = array(
                        "start_id"=>$index,
                        "values"=>array()
                    );
                }
                $isAdd = false;
                $dataIndex = count($data) - 1;
                $data[$dataIndex]["values"][] = $val;
            }
        }
        $revs = array(-1, -1, -1, -1, -1);
        foreach ($pointData['rev'] as $index => $rev) {
            if(isset($revs[$index])) {
                $revs[$index] = $rev;
            }
        }
        foreach($data as $result) {
            $loVPointValues = array();
            $arrWaves = array();
            $tmpWave = array();
            for($i = 0; $i < 512; $i++) {
                $tmpWave[] = 0;
            }

            foreach($result['values'] as $value) {
                for($i=0; $i < 12; $i++) {
                    if($i == 0) {
                        $loVPointValues[] =$value;
                    }
                    else{
                        $loVPointValues[] = 0;
                    }
                }
                $arrWaves = array_merge($arrWaves, $tmpWave);
            }


            $loInfo = array(
                'serverIp'=>$plant['serverIp'],
                'serverPort'=>$plant['serverPort'],
                'serverType'=>$plant['serverType'],
                'linkType'=>$plant['linkType'],
                'companyId'=>$plant['companyId'],
                'factoryId'=>$plant['factoryId'],
                'equipmentId'=>$plant['equipmentId'],
                'channleStartId'=>$result["start_id"],
                'allCharvalue'=>implode(',', $loVPointValues),
                'channleNum'=>count($result['values']),
                'smpFreq'=>800, //$plant['SmpFreq'], // 采样频率
                'smpNum'=>512, //$plant['SmpNum'] // 采样点数
                'wave'=>implode(',', $arrWaves),
                'waveNum'=> count($arrWaves),//strlen(implode(',', $arrWaves)),//count($arrWaves) * 2,
                'rev'=> $revs[0], // 一级转速
                'rev2'=> $revs[1], // 二级转速
                'rev3'=> 0,//$revs[2], // 三级转速
                'rev4'=> 0,//$revs[3], // 四级转速
                'rev5'=> 0,//$revs[4], // 五级转速
            );


            $dcenterIP = C("DCENTER_IP");
            $dcenterPort = C("DCENTER_PORT");
            $url = "http://{$dcenterIP}:{$dcenterPort}/bh5000/24000";

            $param = array(
                'url' => $url,
                'fields' => $loInfo
            );
            $result = createRequest($param);
            dump($loInfo);
        }

        return $result;

    }

    /**
     * 同步工艺量
     */
    private function syncProcessPoints($plant, $pointData){
        if(!is_array($pointData['process'])) {
            return false;
        }
        $data = array();
        $isAdd = true;
        foreach($pointData['process'] as $index=>$val) {
			if($val === null) {
				$isAdd = true;
			}else {
				if($isAdd) {
					$data[] = array(
						"start_id"=>$index,
						"values"=>array()
					);
				}
				$isAdd = false;
				$dataIndex = count($data) - 1;
				$data[$dataIndex]["values"][] = $val;
			}
        }
        foreach($data as $result) {
			$loInfo = array(
                'serverIp'=>$plant['serverIp'],
                'serverPort'=>$plant['serverPort'],
                'serverType'=>$plant['serverType'],
                'linkType'=>$plant['linkType'],
                'companyId'=>$plant['companyId'],
                'factoryId'=>$plant['factoryId'],
                'equipmentId'=>$plant['equipmentId'],
				'channleStartId'=>$result["start_id"],
				'channleString'=>implode(',', $result["values"]),
				'channleNum'=>count($result["values"]),
				'channelType'=>0,
				'fieldSystemStatus'=>1,
			);


            $dcenterIP = C("DCENTER_IP");
            $dcenterPort = C("DCENTER_PORT");
            $url = "http://{$dcenterIP}:{$dcenterPort}/bh5000/24003";

            $param = array(
                'url' => $url,
                'fields' => $loInfo
            );
            $result = createRequest($param);
            dump($loInfo);
		}

        return $result;
    }
    public function processingPoints($points) {
        $data = array(
            'vibrator'=>array(),
            'process'=>array(),
            'rev'=>array()
        );

        $keys = array();
        // 工艺量测点类型
        $processPointTypes = array(0, 3, 4, 5, 6, 7, 8);
        foreach($points as $point) {
            $pointType = $point['channelType'];
            $name = $point['name'];
            $val = $point['val'];

            // 获得振动测点
            if($pointType == 1 || $pointType == 2) {
                $type = 'vibrator';
                $data[$type][] = null;
                $keys[] = array(
                    'name'=> $name,
                    'type'=> $type,
                    'index'=> count($data[$type]) -1
                );
            // 获得工艺量
            }elseif(in_array($pointType, $processPointTypes)) {
                $type = 'process';
                $data[$type][] = null;
                $keys[] = array(
                    'name'=> $name,
                    'type'=> $type,
                    'index'=> count($data[$type]) -1
                );
            }

            if($pointType == 7){
                $type = 'rev';
                $data[$type][] = null;
                $keys[] = array(
                    'name'=> $name,
                    'type'=> $type,
                    'index'=> count($data[$type]) -1
                );
            }
        }
        $analogPointCont = A('Analog/Point');
        $analogPoints = $analogPointCont->getPoints($points[0]['equipmentUuid'], false);

        foreach($keys as $key) {
            $name = $key['name'];
            $type = $key['type'];
            $index = $key['index'];
            if(array_key_exists($name, $analogPoints)) {
                $data[$type][$index] = $analogPoints[$name];
            }
        }
        return $data;
    }

    private function sortPoints($points){
        $tempPoints = array();
        foreach($points as $point){
            $sortIndex = $point['sortIndex'];
            $tempPoints[$sortIndex] = $point;
            ksort($tempPoints);
        }
        return array_values($tempPoints);
    }
    public function getPoints($equipmentUuid = "", $isEcho = true){
        $dcenterIP = C("DCENTER_IP");
        $dcenterPort = C("DCENTER_PORT");
        $url = "http://{$dcenterIP}:{$dcenterPort}/v3/point/list";

        $param = array(
            'url' => $url,
            'fields' => array(
                'equipmentUuid'=>$equipmentUuid
            ));
        $result = createRequest($param);

        if($isEcho){
            echo $result;
        }else {
            $result = json_decode($result, true);
            return $result;
        }
    }
}

package bpx.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Command {

    public static String exec1(String command) throws Exception{
        StringBuilder result = new StringBuilder();
        InputStream is = null;
        BufferedReader reader = null;
        try{
            Process p = Runtime.getRuntime().exec(command);
            is = p.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is));
            p.waitFor();
            
            if(p.exitValue() != 0) {
                result.append("命令执行失败");
                result.append("\n");
            }
            String tmp;
            while((tmp = reader.readLine()) != null) {
                result.append(tmp);
                result.append("\n");
            }
        }catch(Exception e) {
            if(reader != null) {
                reader.close();
            }
            if(is != null) {
                is.close();
            }
            throw e;
        }
        
        return result.toString();
    }
    public static String exec2(String command) throws Exception {
        String[] commandSplit = command.split(" ");
        List<String> lcommand = new ArrayList<>();
        for(String com : commandSplit) {
            lcommand.add(com);
        }
        ProcessBuilder processBuilder = new ProcessBuilder(lcommand);
        processBuilder.redirectErrorStream(true);
        
        StringBuilder result = new StringBuilder();
        
        InputStream is = null;
        BufferedReader reader = null;
        try {
            Process p = processBuilder.start();
            is = p.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is));
            p.waitFor();
            
            if(p.exitValue() != 0) {
                result.append("命令执行失败");
                result.append("\n");
            }
            String tmp;
            while((tmp = reader.readLine()) != null) {
                result.append(tmp);
                result.append("\n");
            }
        } catch (IOException | InterruptedException e) {
            if(reader != null) {
                reader.close();
            }
            if(is != null){
                is.close();
            }
            
            throw e;
        }
        
        
        return result.toString();
    }

}

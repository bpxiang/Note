import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

public class Gis {

   

    public static void main(String[] args) {
        Gis gis = new Gis();
        try {
            gis.createGisImg();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
    public void createGisImg() throws IOException {
        String dir = System.getProperty("user.dir");        
        String imgPath = dir + "/gis.png";
        File file = new File(imgPath);
        String suffix = this.getFileSuffix(file);
        
        BufferedImage sourceImageBuffer= ImageIO.read(file);
        
        int sourceWidth = sourceImageBuffer.getWidth();
        int sourceHeight = sourceImageBuffer.getHeight();
        
        File newImg = new File(dir + "/tile/0/0.jpg");
        int x = 0;
        int y = 0;
        int width = 1000;
        int height = 1000;
        int outWidth = 500;
        int outHeight = 500;
        this.cutImage(file, newImg, x, y, width, height, outWidth, outHeight);
    }
    public void cutImage(File inImg, File outImg, int x, int y, 
            int width, int height, int outWidth, int outHeight) throws IOException {

        String suffix = this.getFileSuffix(inImg);
        Iterator<ImageReader> iterator = ImageIO.getImageReadersByFormatName(suffix);
        ImageReader reader = iterator.next();
  
        //加载源图像
        String imgPath = inImg.getPath();
        InputStream inStream = new FileInputStream(imgPath);
        ImageInputStream inImageStream = ImageIO.createImageInputStream(inStream);
        reader.setInput(inImageStream, true);
        int newWidth = reader.getWidth(0);//图像宽度
        int newHeight = reader.getHeight(0);
        
        
        ImageReadParam param = reader.getDefaultReadParam();
        Rectangle rect = new Rectangle(x, y, width, height);
        param.setSourceRegion(rect);
        BufferedImage outImgBuffer= reader.read(0, param);//获取待选框内容
        
        mkDir(outImg);
        
        ImageIO.write(outImgBuffer, this.getFileSuffix(outImg), outImg);//写图像
        
        System.out.println(newWidth);
        
        
        inImageStream.close();
        inStream.close();
        
//
//        int row=0;
//
//        ImageReadParam param = reader.getDefaultReadParam();
//
//        for (int h = 0; h < height; h += 256) {
//
//            int col=0;
//
//            for (int w = 0; w < width; w += 256) {
//
//                Rectangle rect = new Rectangle(w, h,256 , 256);//设置待选框位置及大小
//                param.setSourceRegion(rect);
//                BufferedImage bi;
//
//                bi= reader.read(0, param);//获取待选框内容
//
//                File f = new File("tile/"+level+"/"+col+"/"+row+".png");
//                mkDir(f);
//                ImageIO.write(bi, "png", f);//写图像
//
//                col++;
//
//            }
//
//            row++;
//        }

    }
    public String getFileSuffix(File file) {
        String fileName = file.getName();  
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);  
        return suffix;
    }
    public void create_level_img() throws IOException {

        int tile_level = 5;
        String root = "tile/";

        int target_height = 0;
        int target_width = 0;
        
        String dir = System.getProperty("user.dir");        
        String imgPath = dir + "/gis.png";
        File file = new File(imgPath);
        BufferedImage inputBufImage = ImageIO.read(file);
        int source_width = inputBufImage.getWidth();
        int source_height = inputBufImage.getHeight();
        
        double source_ratio = source_height / source_width; //高宽比

        //对原图进行缩放处理
        for (int i = 0; i < tile_level; i++) {

            String target_path = root + i;

            if (i == 0) {

                if (source_ratio > 1) {
                    target_height = 256;
                } else {
                    target_width = 256;
                }

            } else if (i == 1) {

                if (source_ratio > 1) {
                    target_height = 512;
                } else {
                    target_width = 512;
                }

            } else {

                int l = (int) Math.pow(2, i);

                if (source_ratio > 1) {
                    target_height = 256 * l;
                } else {
                    target_width = 256 * l;
                }
            }

            if (source_ratio > 1) {
                target_width = source_width * target_height / source_height;
            } else {
                target_height = source_height * target_width / source_width;
            }

            File outFile = new File(target_path);
            String outPath = outFile.getAbsolutePath();

            System.out.println(i + 1 + " start");
            this.resizeImage(file, outPath, target_width, target_height, "png");
            System.out.println(i + 1 + " ing");
            this.cutImage(target_path,i);
            System.out.println(i + 1 + " end");
            System.out.println();
        }

    }


    /**
     * 图片缩放
     *
     * @throws Exception
     */
    public static boolean resizeImage(File file, String writePath, Integer width, Integer height, String format) {

        try {

            BufferedImage source = ImageIO.read(file);
            
            BufferedImage newBufferedImage = new BufferedImage(source.getWidth(), 
                    source.getHeight(), BufferedImage.TYPE_INT_RGB);
            Graphics2D g = newBufferedImage.createGraphics();
            try {
                g.drawImage(source, 0, 0,null);
            if(!ImageIO.write(newBufferedImage, format, new File(writePath + ".png")))
                throw new IllegalArgumentException(String.format("not found writer for '%s'",new File(writePath + ".png")));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }finally{
                g.dispose();
            }

    
//            BufferedImage inputBufImage = ImageIO.read(file);
//            inputBufImage.getType();
//  
//            RescaleOp resampleOp = new RescaleOp(width, height, null);// 转换
//            BufferedImage rescaledTomato = resampleOp.filter(inputBufImage, null);
//
//            ImageIO.write(rescaledTomato, format, new File(writePath + ".png"));
    
            return true;

        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }


    /**
    * 图片裁剪通用接口
    *
    * @param src
    * @throws IOException
    */
   public static void cutImage(String src,int level) throws IOException {

       Iterator<ImageReader> iterator = ImageIO.getImageReadersByFormatName("png");
       ImageReader reader = iterator.next();

       //加载源图像
       InputStream in = null;

       in = new FileInputStream(src + ".png");
       ImageInputStream iis = ImageIO.createImageInputStream(in);
       reader.setInput(iis, true);

       int width = reader.getWidth(0);//图像宽度
       int height = reader.getHeight(0);

       int row=0;

       ImageReadParam param = reader.getDefaultReadParam();

       for (int h = 0; h < height; h += 256) {

           int col=0;

           for (int w = 0; w < width; w += 256) {

               Rectangle rect = new Rectangle(w, h,256 , 256);//设置待选框位置及大小
               param.setSourceRegion(rect);
               BufferedImage bi;

               bi= reader.read(0, param);//获取待选框内容

               File f = new File("tile/"+level+"/"+col+"/"+row+".png");
               mkDir(f);
               ImageIO.write(bi, "png", f);//写图像

               col++;

           }

           row++;
       }

   }

   /**
     * 递归创建目录
     *
     * @param file
     */
    public static void mkDir(File file) {
    
        if (file.getParentFile().exists()) {
            file.mkdir();
        } else {
            mkDir(file.getParentFile());
            file.mkdir();
        }
    }

}


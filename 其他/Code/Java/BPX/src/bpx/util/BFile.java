package bpx.util;

import java.io.File;
import java.util.Arrays;

public class BFile {

    private BFile() {
    }

    public static String getClassDir(Object obj) {
        String dir = System.getProperty("user.dir");
        String separator = System.getProperty("file.separator");
        String className = obj.getClass().getName();
        String[] names = className.split("\\.");
        StringBuilder dirBuilder = new StringBuilder(dir);
        for(int i = 0; i < names.length; i++) {
            String name = names[i];
            dirBuilder.append(separator);
            dirBuilder.append(name);
        }
        dirBuilder.append(separator);
        
        return dirBuilder.toString();
    }
    
    public static String getFileSuffix(File file) {
        String fileName = file.getName();    
        return BFile.getFileNameSuffix(fileName);
    }
    public static String getFileNameSuffix(String fileName) {
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);  
        return suffix;
    }
    
}

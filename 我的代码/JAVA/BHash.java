import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class BHash {
    /**
     * 计算字符串 md5 值
     * @param str
     * @return
     * @throws NoSuchAlgorithmException
     */
    public static String md5(String str) {
        String hashVal = "getMd5ValueError";
        try {
            hashVal = BHash.hash(str, "MD5");
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
        }
        return hashVal;
    }
    /**
     * 计算文件 md5 值
     * @param str
     * @return
     * @throws NoSuchAlgorithmException
     */
    public static String md5(File file) {
        String hashVal = "getMd5ValueError";
        try {
            hashVal = BHash.hash(file, "MD5");
        } catch (NoSuchAlgorithmException | IOException e) {
        }
        return hashVal;
    }

    /**
     * 计算字符串哈希值
     * @param str
     * @param hashType
     * @return
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException 
     */
    private static String hash(String str, String hashType) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md = MessageDigest.getInstance(hashType);
        md.reset();
        md.update(str.getBytes("UTF-8"));
        
        return createHashCode(md.digest());
    }
    
    

    /**
     * 计文件符串哈希值
     * @param file
     * @param hashType
     * @return
     * @throws NoSuchAlgorithmException 
     * @throws IOException 
     * @throws Exception 
     */
    private static String hash(File file, String hashType) throws NoSuchAlgorithmException, IOException {
        
        if(file.exists() && file.isFile()) {
            FileInputStream in = new FileInputStream(file);

            MessageDigest md = MessageDigest.getInstance(hashType);
            
            long fileLength = file.length();
            long start = 0;
            int max = Integer.MAX_VALUE;
            
            do {
                long length;
                if(start + max > fileLength) {
                    length = fileLength - start;
                }else {
                    length = max;
                }
                
                MappedByteBuffer byteBuffer = in.getChannel().map(FileChannel.MapMode.READ_ONLY, start, length);
                md.update(byteBuffer);
                start += length;
            }while(start < fileLength);

            return createHashCode(md.digest());
        }else {
            throw new FileNotFoundException("文件不存在！");
        }
    }
    
    private static String createHashCode(byte[] digest) {
        //return new BigInteger(digest).toString(16);  // 生成 md5 值
        //return new BigInteger(1, digest).toString(16);  // 生成 md5 值
        StringBuffer md5StrBuff = new StringBuffer();    
    
        for (int i = 0; i < digest.length; i++)    
        {    
            if (Integer.toHexString(0xFF & digest[i]).length() == 1)    
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & digest[i]));    
            else    
                md5StrBuff.append(Integer.toHexString(0xFF & digest[i]));    
        }    
        return md5StrBuff.toString(); 
    }
}

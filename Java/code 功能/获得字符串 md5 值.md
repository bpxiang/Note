# 获得字符串 md5 值
>time: 2017-12-27 14:47:25

## 1. 
```java
import org.springframework.util.DigestUtils;
...
String str = "md5";
InputStream inputStream = new ByteArrayInputStream(str.getBytes("UTF-8"));
String md5code = DigestUtils.md5DigestAsHex(inputStream);
```

## 2.
```java
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
        md.update(str.getBytes("UTF-8"));
        return new BigInteger(1, md.digest()).toString(16);
    }
    
    /**
     * 计算字符串 md5 值
     * @param str
     * @return
     * @throws NoSuchAlgorithmException
     */
    public static String md5(String str) {
        String hashVal = "getMd5ValueError";
        try {
            hashVal = StringUtil.hash(str, "MD5");
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
        }
        return hashVal;
    }
```
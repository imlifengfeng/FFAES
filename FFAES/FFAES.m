//
//  FFAES.m
//
//  AES128 + ECB + PKCS7
//

#import "FFAES.h"
#import "GTMBase64.h"

@implementation FFAES

///////////////////Encrypt and decrypt/////////////////////

/**
 AES加密——>NSData
 
 @param data 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSData *)encryptData:(NSData *)data key:(NSString *)key {
    NSData* result = nil;
    
    unsigned char cKey[FFENCRYPT_KEY_SIZE];
    bzero(cKey, sizeof(cKey));
    NSData *keyData = [key dataUsingEncoding:NSASCIIStringEncoding];
    [keyData getBytes:cKey length:FFENCRYPT_KEY_SIZE];
    
    size_t bufferSize = [data length] + FFENCRYPT_BLOCK_SIZE;
    void *buffer = malloc(bufferSize);
    
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          FFENCRYPT_ALGORITHM,
                                          kCCOptionECBMode|kCCOptionPKCS7Padding,
                                          cKey,
                                          FFENCRYPT_KEY_SIZE,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:encryptedSize];
    } else {
        free(buffer);
        NSLog(@"[ERROR]加密失败|CCCryptoStatus: %d", cryptStatus);
    }
    
    return result;
}

/**
 AES解密——>NSData
 
 @param data 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSData *)decryptData:(NSData *)data key:(NSString *)key {
    NSData* result = nil;
    
    unsigned char cKey[FFENCRYPT_KEY_SIZE];
    bzero(cKey, sizeof(cKey));
    NSData *keyData = [key dataUsingEncoding:NSASCIIStringEncoding];
    [keyData getBytes:cKey length:FFENCRYPT_KEY_SIZE];
    
    size_t bufferSize = [data length] + FFENCRYPT_BLOCK_SIZE;
    void *buffer = malloc(bufferSize);
    
    size_t decryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          FFENCRYPT_ALGORITHM,
                                          kCCOptionECBMode|kCCOptionPKCS7Padding,
                                          cKey,
                                          FFENCRYPT_KEY_SIZE,
                                          nil,
                                          [data bytes],
                                          [data length],
                                          buffer,
                                          bufferSize,
                                          &decryptedSize);
    
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:decryptedSize];
    } else {
        free(buffer);
        NSLog(@"[ERROR]解密失败| CCCryptoStatus: %d", cryptStatus);
    }
    
    return result;
}


/**
 AES加密——>NSData
 
 @param str 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSData *)encryptStrToData:(NSString *)str key:(NSString *)key{
    return [self encryptData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                               key:key];
}

/**
 AES加密——>NSString
 
 @param str 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSString *)encryptStrToStr:(NSString *)str key:(NSString *)key{
    NSData *aesData = [self encryptData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                    key:key];
    return [[NSString alloc] initWithData:aesData encoding:NSUTF8StringEncoding];
}

/**
 AES解密——>NSData
 
 @param str 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSData *)decryptStrToData:(NSString *)str key:(NSString *)key{
    return [self decryptData:[str dataUsingEncoding:NSUTF8StringEncoding]
                         key:key];
}

/**
 AES解密——>NSString
 
 @param str 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSString *)decryptStrToStr:(NSString *)str key:(NSString *)key{
    NSData *decryptData = [self decryptData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                        key:key];
    return [[NSString alloc]initWithData:decryptData encoding:NSUTF8StringEncoding];
}


///////////////////Encrypt and decrypt with base64/////////////////////

/**
 AES加密——>Base64——>NSData
 
 @param str 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSData *)encryptStrAndBase64ToData:(NSString *)str key:(NSString *)key {
    NSData *aesData = [self encryptData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                               key:key];
    return [[NSString stringWithFormat:@"%@",[GTMBase64 stringByEncodingData:aesData]] dataUsingEncoding:NSUTF8StringEncoding];
}

/**
 AES加密——>Base64——>NSString
 
 @param str 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSString *)encryptStrAndBase64ToStr:(NSString *)str key:(NSString *)key {
    NSData *aesData = [self encryptData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                    key:key];
    return [GTMBase64 stringByEncodingData:aesData];
}

/**
 Base64解码——>AES解密——>NSData
 
 @param str 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSData *)decryptBase64andAESToData:(NSString *)str key:(NSString *)key {
    return [self decryptData:[GTMBase64 decodeString:str] key:key];
}

/**
 Base64解码——>AES解密——>NSString
 
 @param str 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSString *)decryptBase64andAESToStr:(NSString *)str key:(NSString *)key{
    NSData *decryptData = [self decryptData:[GTMBase64 decodeString:str] key:key];
    
    return [[NSString alloc]initWithData:decryptData encoding:NSUTF8StringEncoding];
}


@end

//
//  FFAES.h
//
//  AES128 + ECB + PKCS7
//

#import <CommonCrypto/CommonCryptor.h>
#import <Foundation/Foundation.h>

#define FFENCRYPT_ALGORITHM     kCCAlgorithmAES128
#define FFENCRYPT_BLOCK_SIZE    kCCBlockSizeAES128
#define FFENCRYPT_KEY_SIZE      kCCKeySizeAES128

@interface FFAES : NSObject


///////////////////Encrypt and decrypt/////////////////////

/**
 AES加密data——>NSData

 @param data 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSData *)encryptData:(NSData *)data key:(NSString *)key;

/**
 AES加密str——>NSData

 @param str 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSData *)encryptStrToData:(NSString *)str key:(NSString *)key;

/**
 AES加密str——>NSString
 
 @param str 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSString *)encryptStrToStr:(NSString *)str key:(NSString *)key;

/**
 AES解密data——>NSData
 
 @param data 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSData *)decryptData:(NSData *)data key:(NSString *)key;

/**
 AES解密str——>NSData
 
 @param str 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSData *)decryptStrToData:(NSString *)str key:(NSString *)key;

/**
 AES解密str——>NSString
 
 @param str 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSString *)decryptStrToStr:(NSString *)str key:(NSString *)key;



///////////////////Encrypt and decrypt with base64/////////////////////

/**
 AES加密——>Base64——>NSData
 
 @param str 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSData *)encryptStrAndBase64ToData:(NSString *)str key:(NSString *)key;

/**
 AES加密——>Base64——>NSString
 
 @param str 要加密的原始数据
 @param key 加密 key
 @return 加密后数据
 */
+ (NSString *)encryptStrAndBase64ToStr:(NSString *)str key:(NSString *)key;

/**
 Base64解码——>AES解密——>NSData
 
 @param str 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSData *)decryptBase64andAESToData:(NSString *)str key:(NSString *)key;

/**
 Base64解码——>AES解密——>NSString
 
 @param str 要解密的原始数据
 @param key 解密 key
 @return 解密后数据
 */
+ (NSString *)decryptBase64andAESToStr:(NSString *)str key:(NSString *)key;


@end

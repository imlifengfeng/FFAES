# FFAES

[![Version](https://img.shields.io/cocoapods/v/FFAES.svg?style=flat)](http://cocoapods.org/pods/FFAES)
[![License](https://img.shields.io/cocoapods/l/FFAES.svg?style=flat)](http://cocoapods.org/pods/FFAES)
[![Platform](https://img.shields.io/cocoapods/p/FFAES.svg?style=flat)](http://cocoapods.org/pods/FFAES)

### [中文教程](https://github.com/imlifengfeng/FFAES/blob/master/README.md#中文使用说明)

### Features

- [x] AES128 + ECB + PKCS7
- [x] AES encrypt
- [x] AES decrypt
- [x] AES encrypt and base64
- [x] base64 decode and AES decrypt


### Installation
#### CocoaPods
To install FFAES using CocoaPods, please integrate it in your existing Podfile, or create a new Podfile:

```ruby
target 'MyApp' do
  pod 'FFAES'
end
```
Then run `pod install`.

#### Manual

Add FFAES folder to your project

### Usage
```objective-c
///////////////////Encrypt and decrypt/////////////////////

/**
 AES encrypt data——>NSData
 @param data The original data to be encrypted
 @param key Encrypt key
 @return Encrypted data
 */
+ (NSData *)encryptData:(NSData *)data key:(NSString *)key;

/**
 AES encrypt str——>NSData
 @param str The original data to be encrypted
 @param key Encrypt key
 @return Encrypted data
 */
+ (NSData *)encryptStrToData:(NSString *)str key:(NSString *)key;

/**
 AES encrypt str——>NSString
 
 @param str The original data to be encrypted
 @param key Encrypt key
 @return Encrypted data
 */
+ (NSString *)encryptStrToStr:(NSString *)str key:(NSString *)key;

/**
 AES decrypt data——>NSData
 
 @param data The original data to be decrypted
 @param key Decrypt key
 @return Decrypted data
 */
+ (NSData *)decryptData:(NSData *)data key:(NSString *)key;

/**
 AES decrypt str——>NSData
 
 @param str The original data to be decrypted
 @param key Decrypt key
 @return Decrypted data
 */
+ (NSData *)decryptStrToData:(NSString *)str key:(NSString *)key;

/**
 AES解密str——>NSString
 
 @param str The original data to be decrypted
 @param key Decrypt key
 @return Decrypted data
 */
+ (NSString *)decryptStrToStr:(NSString *)str key:(NSString *)key;



///////////////////Encrypt and decrypt with base64/////////////////////

/**
 AES Encrypt——>Base64——>NSData
 
 @param str The original data to be encrypted
 @param key encrypt key
 @return Encrypted data
 */
+ (NSData *)encryptStrAndBase64ToData:(NSString *)str key:(NSString *)key;

/**
 AES Encrypt——>Base64——>NSString
 
 @param str The original data to be encrypted
 @param key encrypt key
 @return Encrypted data
 */
+ (NSString *)encryptStrAndBase64ToStr:(NSString *)str key:(NSString *)key;

/**
 Base64 decode——>AES decrypt——>NSData
 
 @param str The original data to be decrypted
 @param key Decrypt key
 @return Decrypted data
 */
+ (NSData *)decryptBase64andAESToData:(NSString *)str key:(NSString *)key;

/**
 Base64 decode——>AES decrypt——>NSString
 
 @param str The original data to be decrypted
 @param key Decrypt key
 @return Decrypted data
 */
+ (NSString *)decryptBase64andAESToStr:(NSString *)str key:(NSString *)key;

```
### License

Usage is provided under the <a href="http://opensource.org/licenses/MIT">MIT</a> License. See <a href="https://github.com/imlifengfeng/FFAES/blob/master/LICENSE">LICENSE</a> for full details.

## 中文使用说明
### 功能

- [x] AES128 + ECB + PKCS7
- [x] AES 加密
- [x] AES 解密
- [x] AES 加密后 base64
- [x] base64 解码和 AES 解密


### 安装
#### CocoaPods

```ruby
target 'MyApp' do
  pod 'FFAES'
end
```
运行 `pod install`.

#### 手动安装

添加 FFAES 文件夹到自己项目

### 使用方法
```objective-c
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

```

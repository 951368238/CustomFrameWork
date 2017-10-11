//
//  DesUtilTow.m
//  test
//
//  Created by User on 16/5/9.
//  Copyright © 2016年 User. All rights reserved.
//
//
//  DES3Util.m
//


#import "DesUtilTow.h"

#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"
#define gkey            @"my.oschina.net/penngo?#@"
#define gIv             @"01234567"

@implementation DesUtilTow
// 加密方法
+ (NSString*)encrypt:(NSString*)plainText key:(NSString*)key{
    NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    size_t plainTextBufferSize = [data length];
    const void *vplainText = (const void *)[data bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [key UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    ccStatus = CCCrypt(kCCEncrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
    NSString *result = [GTMBase64 stringByEncodingData:myData];
    return result;
}
+ (NSString*)encrypt_source:(NSString*)source key:(NSString*)key
{
    NSData* data = [source dataUsingEncoding:NSUTF8StringEncoding];
    NSString *result = [GTMBase64 stringByEncodingData:data];
    return result;
}

+ (NSString*)decrypt_source:(NSString*)source key:(NSString*)key{
    NSString *encryptData =[[NSString alloc]initWithData:  [GTMBase64 decodeData:[source dataUsingEncoding:NSUTF8StringEncoding]] encoding:NSUTF8StringEncoding];
    return encryptData;
}
// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText key:(NSString *)key{
    NSData *encryptData = [GTMBase64 decodeData:[encryptText dataUsingEncoding:NSUTF8StringEncoding]];
    size_t plainTextBufferSize = [encryptData length];
    const void *vplainText = [encryptData bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    const void *vkey = (const void *) [key UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    ccStatus = CCCrypt(kCCDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSString *result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                                     length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding];
    return result;
    // return result;
}








@end

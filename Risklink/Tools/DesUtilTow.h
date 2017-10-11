//
//  DesUtilTow.h
//  test
//
//  Created by User on 16/5/9.
//  Copyright © 2016年 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DesUtilTow : NSObject
+(NSString*) encrypt:(NSString*)plainText key:(NSString*)key;
+ (NSString*)encrypt_source:(NSString*)source key:(NSString*)key;
+ (NSString*)decrypt_source:(NSString*)source key:(NSString*)key;
+(NSString *) decrypt:(NSString *)encryptText key:(NSString *)key;
@end

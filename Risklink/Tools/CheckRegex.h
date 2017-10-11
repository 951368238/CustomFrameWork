//
//  CheckTel.h
//  3Abiz_IOS
//
//  Created by zhengwan on 16/9/5.
//  Copyright © 2016年 zhengwan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CheckRegex : NSObject
+ (NSString *)remove86InMobile:(NSString *)mobileNumber;
+(BOOL)checkTel:(NSString *)str;
+ (BOOL)valiMobile:(NSString *)mobile;
+ (BOOL) validateEmail:(NSString *)email;
+(BOOL)checkMoney:(NSString*)money;
+(BOOL)checkChinese:(NSString*)str;
@end

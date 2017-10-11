//
//  NSString+GuGu.h
//  估估信用
//
//  Created by 王晟骏 on 2017/4/12.
//  Copyright © 2017年 李想. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GuGu)

+ (NSAttributedString *)scoreWithString:(NSString *)text;
+ (BOOL)validateMobile:(NSString *)mobile;

//首字母变小写
+ (NSString *)lowerCaseCaptitalString:(NSString *)string;
//去除末尾的"Model"
+ (NSString *)removeSuffixModel:(NSString *)string;

//More
+ (NSString *)clazzNameWithType:(NSString *)type;
+ (NSString *)keyWithType:(NSString *)type;


+ (NSString *)serviceTypeOfText:(NSString *)text;
+ (NSString *)CodeOfServiceType:(NSString *)text;

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;
+ (NSString *)currentDate;
+(NSString *)getNowTimeTimestamp;

@end

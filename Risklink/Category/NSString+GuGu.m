//
//  NSString+GuGu.m
//  估估信用
//
//  Created by 王晟骏 on 2017/4/12.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "NSString+GuGu.h"

@implementation NSString (GuGu)

+ (NSAttributedString *)scoreWithString:(NSString *)text {
    
    if ([text integerValue] > 5) {
        return nil;
    }
    
    NSString *starText = @"★★★★★";
    NSMutableAttributedString *star = [[NSMutableAttributedString alloc] initWithString:starText];
    [star addAttribute:NSForegroundColorAttributeName value:APP_ORANGE_COLOR range:NSMakeRange(0, [text integerValue])];
    return star;
    
}

/**
 *  正则表达式验证手机号
 *
 *  @param mobile 传入手机号
 *
 *  @return BOOL
 */
+ (BOOL)validateMobile:(NSString *)mobile
{
    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

+ (NSString *)lowerCaseCaptitalString:(NSString *)string {
    
    NSString *capital = [string substringWithRange:NSMakeRange(0, 1)];
    NSString *lowerCaseCapital = [capital lowercaseString];
    NSString *restPartString = [string substringWithRange:NSMakeRange(1, string.length - 1)];
    return [NSString stringWithFormat:@"%@%@", lowerCaseCapital, restPartString];
    
}

+ (NSString *)upperCaseCapitalString:(NSString *)string {
    
    NSString *capital = [string substringWithRange:NSMakeRange(0, 1)];
    NSString *upperCaseCapital = [capital uppercaseString];
    NSString *restPartString = [string substringWithRange:NSMakeRange(1, string.length - 1)];
    return [NSString stringWithFormat:@"%@%@", upperCaseCapital, restPartString];
    
}

+ (NSString *)removeSuffixModel:(NSString *)string {
    
    if ([string hasSuffix:@"Model"]) {
        return [string substringWithRange:NSMakeRange(0, string.length - 5)];
    }
    return string;
    
}

+ (NSString *)addSuffixModel:(NSString *)string {
    
    return [NSString stringWithFormat:@"%@%@", string, @"Model"];
    
}

#pragma mark - More

+ (NSString *)keyWithType:(NSString *)type {
    
    if ([@"3" isEqualToString:type]) {
        
        return @"shareholderInfos";
        
    } else if ([@"4" isEqualToString:type]) {
        
        return @"managements";
        
    } else if ([@"13" isEqualToString:type]) {
        
        return @"";
        
    } else if ([@"2" isEqualToString:type]) {
        
        return @"changeInfos";
        
    } else if ([@"6" isEqualToString:type]) {
        
        return @"rulingdocuments";
        
    } else if ([@"11" isEqualToString:type]) {
        
        return @"brands";
        
    } else if ([@"5" isEqualToString:type]) {
        
        return @"fygg";
        
    } else if ([@"10" isEqualToString:type]) {
        
        return @"mediaRecords";
        
    } else if ([@"8" isEqualToString:type]) {
        
        return @"executives";
        
    } else if ([@"9" isEqualToString:type]) {
        
        return @"operationAbnormalInfos";
        
    } else if ([@"12" isEqualToString:type]) {
        
        return @"icpWebsites";
        
    } else if ([@"7" isEqualToString:type]) {
        
        return @"sxgg";
        
    }
    
    return @"";
    
}

+ (NSString *)serviceTypeOfText:(NSString *)text {
    
    if ([@"金融服务" isEqualToString:text]) {
        return @"1";
    } else if ([@"法律服务" isEqualToString:text]) {
        return @"2";
    } else if ([@"租车服务" isEqualToString:text]) {
        return @"3";
    } else if ([@"保险服务" isEqualToString:text]) {
        return @"4";
    } else if ([@"物流服务" isEqualToString:text]) {
        return @"5";
    } else if ([@"网络服务" isEqualToString:text]) {
        return @"6";
    } else if ([@"人员服务" isEqualToString:text]) {
        return @"7";
    } else if ([@"印刷服务" isEqualToString:text]) {
        return @"8";
    } else if ([@"翻译服务" isEqualToString:text]) {
        return @"9";
    } else if ([@"医疗服务" isEqualToString:text]) {
        return @"10";
    } else if ([@"广告服务" isEqualToString:text]) {
        return @"11";
    } else if ([@"办公服务" isEqualToString:text]) {
        return @"12";
    }
    
    return @"1";
    
}

+ (NSString *)CodeOfServiceType:(NSString *)text {
    
    if ([@"1" isEqualToString:text]) {
        return @"金融服务";
    } else if ([@"2" isEqualToString:text]) {
        return @"法律服务";
    } else if ([@"3" isEqualToString:text]) {
        return @"租车服务";
    } else if ([@"4" isEqualToString:text]) {
        return @"保险服务";
    } else if ([@"5" isEqualToString:text]) {
        return @"物流服务";
    } else if ([@"6" isEqualToString:text]) {
        return @"网络服务";
    } else if ([@"7" isEqualToString:text]) {
        return @"人员服务";
    } else if ([@"8" isEqualToString:text]) {
        return @"印刷服务";
    } else if ([@"9" isEqualToString:text]) {
        return @"翻译服务";
    } else if ([@"10" isEqualToString:text]) {
        return @"医疗服务";
    } else if ([@"11" isEqualToString:text]) {
        return @"广告服务";
    } else if ([@"12" isEqualToString:text]) {
        return @"办公服务";
    }
    
    return @"金融服务";
    
}

+ (NSString *)clazzNameWithKey:(NSString *)key {
    
    NSString *upperCase = [NSString upperCaseCapitalString:key];
    NSString *addedSuffix = [NSString addSuffixModel:upperCase];
    return addedSuffix;
    
}

+ (NSString *)clazzNameWithType:(NSString *)type {
    
    NSString *keyName = [NSString keyWithType:type];
    return [NSString clazzNameWithKey:keyName];
    
}

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)currentDate {
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate date];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;

    
}

+(NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSDate *confromTimespNow = [NSDate dateWithTimeIntervalSince1970:[datenow timeIntervalSince1970]];

    NSString *timeSp = [NSString stringWithFormat:@"%lld", (long long)([confromTimespNow timeIntervalSince1970]*1000)];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[datenow timeIntervalSince1970]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"时间戳转时间   = %@",[formatter stringFromDate:confromTimespNow]);
    
    return timeSp;
    
}

@end

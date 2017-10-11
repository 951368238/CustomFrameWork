//
//  CheckTel.m
//  3Abiz_IOS
//
//  Created by zhengwan on 16/9/5.
//  Copyright © 2016年 zhengwan. All rights reserved.
//

#import "CheckRegex.h"

@implementation CheckRegex

+ (NSString *)remove86InMobile:(NSString *)mobileNumber {
    NSString *cardPhone = mobileNumber;
    NSString *cardPhonePrefix;
    if (cardPhone && cardPhone.length > 11) {
        cardPhonePrefix = [cardPhone substringWithRange:NSMakeRange(0, cardPhone.length - 11)];
    }
    if (cardPhonePrefix && cardPhonePrefix.length > 0 && [cardPhonePrefix containsString:@"86"]) {
        cardPhone = [cardPhone substringWithRange:NSMakeRange(cardPhonePrefix.length, 11)];
    }
    return cardPhone;
}


/*
 --------------------------------------------
 Date:2016年09月05日10:40:45
 正则表达式判断手机号 13 15 18 开头所有手机号
 --------------------------------------------
 */
#pragma mark - ----正则表达式判断手机号----
+(BOOL)checkTel:(NSString *)str
{
    if ([str length] == 0) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"data_null_prompt", nil) message:NSLocalizedString(@"tel_no_null", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    //1[0-9]{10}
    
    //^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
    
    //    NSString *regex = @"[0-9]{11}";
    
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (!isMatch) {
        [self showHudTipStr:@"请输入正确的手机号码"];
        return NO;
    }
    return YES;
    
}


#pragma mark - ----验证手机号----
+ (BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            [self showHudTipStr:@"请输入正确的手机号码"];
            return NO;
        }
    }
}

#pragma mark - ----验证邮箱----
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL right=[emailTest evaluateWithObject:email];
    if(right==YES){
        return YES;
    }else{
        [self showHudTipStr:@"请输入正确的邮箱"];
        return NO;
    }
}
/*
 --------------------------------------------
 Date:2016年09月05日10:40:17
 不允许负数，除数字小数点之外的字符也不可以，小数点只允许出现一次。
 --------------------------------------------
 */
#pragma mark - ----正则表达式判断金额----
+(BOOL)checkMoney:(NSString*)money
{
    NSString *regex = @"/^(([1-9]\\d*)|0)(\\.\\d{1,2})?$/";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:money];
    
    if (!isMatch) {
        
        [self showHudTipStr:@"请输入正确的金额"];
        return NO;
    }
    return YES;
}
+(BOOL)checkChinese:(NSString*)str{
    NSInteger count =0;
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            count++;
        }
    }
    if(count==0){
        return NO;
    }else{
        return YES;
    }
}
@end

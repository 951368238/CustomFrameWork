//
//  DesJiaMi.m
//  3Abiz_iOS
//
//  Created by zhengwan on 16/5/6.
//  Copyright © 2016年 luo. All rights reserved.
//

#import "DesJiaMi.h"
#import "DesUtilTow.h"
@implementation DesJiaMi
+(NSString*)DesJiaMiWithDictionary:(NSDictionary*)dict
{
    NSData*data=[NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString*jsonStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSString *jiamihou=[DesUtilTow encrypt:jsonStr key:@"3abiz123453abiz123453abi"];
    NSLog(@"DES加密后的内容 = = = %@",jiamihou);
//    NSString*finaStr=[jiamiNSstring stringWithSourceString:jiamihou];
//    NSString * finaStr=[jiamiNSstring stingWithstring:jiamihou];
    
    NSLog(@"转后 的加密内容 = = %@",jiamihou);
    return jiamihou;
}
+(NSDictionary*)DesjieMiWithData:(NSString*)string
{
    NSString*jiemihou=[DesUtilTow decrypt:string key:@"3abiz123453abiz123453abi"];
    NSData*data=[jiemihou dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary*dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dict;
}
+(NSString*)DesJiaMiWithDictionary:(NSString*)str andKey:(NSString*)key
{
    NSString *jiamihou=[DesUtilTow encrypt:str key:key];
    return jiamihou;
}
+(NSString*)DesjieMiWithData:(NSString*)string andKey:(NSString*)key
{
    NSString*jiemihou=[DesUtilTow decrypt:string key:key];
    return jiemihou;
}
@end

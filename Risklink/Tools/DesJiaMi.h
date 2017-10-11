//
//  DesJiaMi.h
//  3Abiz_iOS
//
//  Created by zhengwan on 16/5/6.
//  Copyright © 2016年 luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DesJiaMi : NSObject
+(NSString*)DesJiaMiWithDictionary:(NSDictionary*)dict;
+(NSDictionary*)DesjieMiWithData:(NSString*)string;
+(NSString*)DesJiaMiWithDictionary:(NSString*)str andKey:(NSString*)key;
+(NSString*)DesjieMiWithData:(NSString*)string andKey:(NSString*)key;
@end

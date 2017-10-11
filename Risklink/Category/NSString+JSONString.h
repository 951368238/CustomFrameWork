//
//  NSString+JSONString.h
//  估估信用
//
//  Created by 王晟骏 on 2017/4/20.
//  Copyright © 2017年 李想. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSONString)

+ (NSString*)convertToJSONData:(id)infoDict;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (NSDictionary *)dictionaryWithData:(NSData *)data;

@end

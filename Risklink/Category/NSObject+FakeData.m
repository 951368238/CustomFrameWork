//
//  NSObject+FakeData.m
//  估估信用
//
//  Created by 王晟骏 on 2017/4/19.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "NSObject+FakeData.h"

@implementation NSObject (FakeData)

- (instancetype)initWithFakeData {
    
    if (self = [self init]) {
        
        [self fakeData];
        
    }
    
    return self;
    
}

- (void)fakeData {
    
    u_int count;
    objc_property_t *properties  = class_copyPropertyList([self class], &count);
    for (int i = 0; i<count; i++) {
        
        const char *property_type = property_getAttributes(properties[i]);
        const char *property_name = property_getName(properties[i]);
        
        NSString *propertyName = [[NSString alloc] initWithBytes:property_name
                                                          length:strlen(property_name)
                                                        encoding:NSASCIIStringEncoding];
        NSString *propertyType = [[NSString alloc] initWithBytes:property_type
                                                          length:strlen(property_type)
                                                        encoding:NSASCIIStringEncoding];
        
        NSString *thePropertyType = [self typeOfRawPropertyType:property_type
                                                           type:propertyType];
        if ([@"NSString" isEqualToString:thePropertyType]
            || [@"NSString<Optional>" isEqualToString:thePropertyType]) {
            
            [self setValue:@"test" forKey:propertyName];
            
        }
        
    }
    free(properties);
    
}

- (NSString *)typeOfRawPropertyType:(const char *)property_type type:(NSString *)propertyType {
    
    switch(property_type[1]) {
        case 'i':
            return @"int";
            break;
        case 'f' :
            return @"float";
            break;
        case 's' :
            return @"short";
            break;
        case '@' : //Obj-c object, here you can check for differnet types like nsstring, nsdictionary, nsarray etc
            return [propertyType componentsSeparatedByString:@"\""][1];
            break;
    }
    
    return @"";
    
}

@end

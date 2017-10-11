//
//  NSObject+DesUtil.h
//  test
//
//  Created by User on 16/4/9.
//  Copyright © 2016年 User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DesUtil)

-(NSString*)decryptUseDES:(NSString*)cipherText key:(NSString*)key;
-(NSString *)encryptUseDES:(NSString *)clearText key:(NSString *)key;
-(void)testwh;

@end

//
//  UIViewController+Log.m
//  估估信用
//
//  Created by 3AZW on 2017/5/17.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "objc/runtime.h"
@implementation UIViewController (Log)

+(void)load{
    // 实现init 与 dt_init方法的交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL org_Selector = @selector(viewDidLoad);
        SEL dt_Selector  = @selector(dt_viewDidLoad);
        
        Method org_method = class_getInstanceMethod([self class], org_Selector);
        Method dt_method  = class_getInstanceMethod([self class], dt_Selector);
        
        BOOL isAdd = class_addMethod(self, org_Selector, method_getImplementation(dt_method), method_getTypeEncoding(dt_method));
        if (isAdd) {
            class_replaceMethod(self, dt_Selector, method_getImplementation(org_method), method_getTypeEncoding(org_method));
        }else{
            method_exchangeImplementations(org_method, dt_method);
        }
        
    });
}

-(void)dt_viewDidLoad{
    
    NSLog(@"进入了----%@界面-------", NSStringFromClass([self class]));
    [self dt_viewDidLoad];
    
}


@end

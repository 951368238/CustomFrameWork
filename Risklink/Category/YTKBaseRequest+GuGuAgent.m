//
//  YTKBaseRequest+GuGuAgent.m
//  估估信用
//
//  Created by 王晟骏 on 2017/5/9.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "objc/runtime.h"

@implementation YTKBaseRequest (GuGuAgent)

+(void)load{
    // 实现init 与 dt_init方法的交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL org_Selector = @selector(setCompletionBlockWithSuccess:failure:);
        SEL dt_Selector  = @selector(dt_setCompletionBlockWithSuccess:failure:);
        
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

- (void)dt_setCompletionBlockWithSuccess:(YTKRequestCompletionBlock)success
                                 failure:(YTKRequestCompletionBlock)failure {

    self.successCompletionBlock = ^(__kindof YTKBaseRequest * _Nonnull request) {
        
        if (request.responseObject
            && [request.responseObject[@"code"] integerValue] == 0) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"tokenFailed" object:nil userInfo:request.responseObject];
            
        }
        
        success(request);
    };
    self.failureCompletionBlock = failure;
    
}

@end

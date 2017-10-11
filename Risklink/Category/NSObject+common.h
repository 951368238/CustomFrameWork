//
//  NSObject+common.h
//  3Abiz_IOS
//
//  Created by zhengwan on 16/6/15.
//  Copyright © 2016年 zhengwan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (common)
- (void)showHudTipStr:(NSString *)tipStr;
- (void)showHudRoundHide:(BOOL)boo;
- (void)hideHUD;
- (void)hideHUDForView:(UIView *)view;
@end

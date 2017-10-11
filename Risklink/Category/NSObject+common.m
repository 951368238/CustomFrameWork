//
//  NSObject+common.m
//  3Abiz_IOS
//
//  Created by zhengwan on 16/6/15.
//  Copyright © 2016年 zhengwan. All rights reserved.
//

#import "NSObject+common.h"
#import "MBProgressHUD.h"
@implementation NSObject (common)
- (void)showHudTipStr:(NSString *)tipStr
{
    if (tipStr && tipStr.length > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:rootWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = tipStr;
        hud.margin = 10.f;
        
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1];
    }
}
- (void)showHudRoundHide:(BOOL)boo
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:rootWindow animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
}
- (void)hideHUD
{
    [self hideHUDForView:nil];
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
- (void)hideHUDForView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end

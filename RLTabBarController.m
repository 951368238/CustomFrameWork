//
//  GGTabBarController.m
//  估估信用
//
//  Created by 李想 on 2017/3/6.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "RLTabBarController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface RLTabBarController ()
@property(nonatomic,strong)UIViewController * subVC;
@end

@implementation RLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildVC];
}
-(void)addChildVC{


    
    NSArray *subItemsVC = @[
                             @{kClassKey  : @"HomeVC",
                               kTitleKey  : @"首页",
                               kImgKey    : @"shouye",
                               kSelImgKey : @"shouyexuanzhong"},
                             
                             @{kClassKey  : @"OrderVC",
                               kTitleKey  : @"订单",
                               kImgKey    : @"dingdan",
                               kSelImgKey : @"dingdanxuanzhong"},
                             
                             @{kClassKey  : @"CarVC",
                               kTitleKey  : @"车型",
                               kImgKey    : @"chexing",
                               kSelImgKey : @"chexing-xuanzhong"},
                             
                             @{kClassKey  : @"MyVC",
                               kTitleKey  : @"我的",
                               kImgKey    : @"wode",
                               kSelImgKey : @"wodexuanzhong"}
                            ];
    
    
    [subItemsVC enumerateObjectsUsingBlock:^(NSDictionary * dict, NSUInteger idx, BOOL * _Nonnull stop) {
        
        _subVC = [[NSClassFromString(dict[kClassKey]) alloc]init];
        _subVC.title = dict[kTitleKey];
        
        RLNavigationController * nav=[[RLNavigationController alloc] initWithRootViewController:_subVC];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image=[UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : navbg} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

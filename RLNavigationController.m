//
//  RLNavigationController.m
//  Risklink
//
//  Created by 李想 on 2017/8/14.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "RLNavigationController.h"

@interface RLNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, weak) id PopDelegate;

@end

@implementation RLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.PopDelegate = self.interactivePopGestureRecognizer.delegate;
    self.navigationBar.barTintColor=navbg;
    self.navigationBar.tintColor=[UIColor whiteColor];
    self.navigationBar.shadowImage=[UIImage imageWithColor:navbg];
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:navbg] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangHK-Medium" size:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.delegate = self;
    self.automaticallyAdjustsScrollViewInsets=NO;
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //判断是否为根控制器 如果不是根控制器，则隐藏底部tabbar 并设置返回按钮
    if(self.childViewControllers.count !=0){
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]
                                                         initWithImage:[UIImage imageNamed:@"navBackItem"]
                                                         style:UIBarButtonItemStylePlain
                                                         target:self
                                                         action:@selector(backPop)];
    }else{
        //不是则不隐藏Tabbar
        viewController.hidesBottomBarWhenPushed=NO;
    }
    
    [super pushViewController:viewController animated:animated];
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.PopDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}
//重写返回按钮的方法时间 返回上一个压栈控制器
-(void)backPop{
    [self popViewControllerAnimated:YES];
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

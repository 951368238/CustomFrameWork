//
//  HomeVC.m
//  Risklink
//
//  Created by 李想 on 2017/8/15.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "HomeVC.h"
#import "homeHeadView.h"
@interface HomeVC ()
@property(nonatomic,strong)homeHeadView * headView;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _headView =[[homeHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,242)];
    [self.view addSubview:_headView];
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

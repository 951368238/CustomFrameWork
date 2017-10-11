//
//  timerButton.h
//  估估信用
//
//  Created by 李想 on 2017/3/21.
//  Copyright © 2017年 李想. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol timerButtonDelegate <NSObject>
-(BOOL)checkPhoneNumber;

@end

@interface timerButton : UIView
@property(nonatomic,strong)UIButton * button;
@property(nonatomic,assign)NSString * titleName;
@property (nonatomic, strong, readwrite) NSTimer *timer;
@property(nonatomic,assign)NSTimeInterval durationToValidity;
@property(nonatomic,strong)NSString * phoneNum;
@property(nonatomic,copy)void(^clickBlock)(int suiji);
@property(nonatomic,assign)id<timerButtonDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame title:(NSString*)name titleColor:(UIColor*)titleColor bgc:(UIColor*)color font:(UIFont*)font corner:(NSInteger)corner time:(NSTimeInterval)time;
@end

//
//  timerButton.m
//  估估信用
//
//  Created by 李想 on 2017/3/21.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "timerButton.h"
@interface timerButton()
@property(nonatomic,assign)NSTimeInterval remeberTime;

@end
@implementation timerButton
-(instancetype)initWithFrame:(CGRect)frame title:(NSString*)name titleColor:(UIColor*)titleColor bgc:(UIColor*)color font:(UIFont*)font corner:(NSInteger)corner time:(NSTimeInterval)time{
    _titleName=name;
    _durationToValidity=time;
    _remeberTime=time;
    self.userInteractionEnabled=YES;
    if(self=[super initWithFrame:frame]){
        [self createButtonColor:color title:name titleColor:titleColor font:font corner:corner];
    }
    return self;
}
-(void)createButtonColor:(UIColor*)color title:(NSString*)name titleColor:(UIColor*)titleColor font:(UIFont*)font corner:(NSInteger)cor{
    _button=[UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:name forState:UIControlStateNormal];
    [_button setTitle:name forState:UIControlStateSelected];
    [_button setTitleColor:titleColor forState:UIControlStateNormal];
    [_button setTitleColor:titleColor forState:UIControlStateSelected];
    _button.backgroundColor=color;
    _button.titleLabel.font=font;
    self.layer.cornerRadius=cor;
    self.layer.masksToBounds=YES;
    _button.frame=self.bounds;
    [self addSubview:_button];
    [[_button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        
        if([self.delegate respondsToSelector:@selector(checkPhoneNumber)]){
            if([self.delegate checkPhoneNumber]==YES){
                if (_button.isEnabled) {
                    [self setEnable_code_btn:NO btn:_button];
                }
                [_button setTitle:[NSString stringWithFormat:@"%.0f 秒", _durationToValidity] forState:UIControlStateNormal];
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                              target:self
                                                            selector:@selector(redrawTimer:)
                                                            userInfo:_button
                                                             repeats:YES];
                if(_clickBlock){
                    int suijishu=(arc4random()%8999)+1000;
                    _clickBlock(suijishu);
                }
            }
        }
    }];
}

- (void)setEnable_code_btn:(BOOL)enabled btn:(UIButton *)btn {
    btn.enabled = enabled;
    if (enabled) {
        [btn setTitle:@"发送验证码" forState:UIControlStateNormal];
    }else if ([btn.titleLabel.text isEqualToString:@"发送验证码"]){
        [btn setTitle:@"正在发送..." forState:UIControlStateNormal];
    }
}

- (void)invalidateTimer:(UIButton *)btn{
    if (!btn.isEnabled) {
        _durationToValidity=_remeberTime;
        [self setEnable_code_btn:YES btn:btn];
    }
    [self.timer invalidate];
    self.timer = nil;
}

- (void)redrawTimer:(NSTimer *)timer {
    UIButton *btn = (UIButton *)timer.userInfo;
    _durationToValidity--;
    if (_durationToValidity > 0) {
        
        //防止 button_title 闪烁//
        btn.titleLabel.text = [NSString stringWithFormat:@"%.0f 秒", _durationToValidity];
        [btn setTitle:[NSString stringWithFormat:@"%.0f 秒", _durationToValidity] forState:UIControlStateNormal];
    }else{
        [self invalidateTimer:btn];
    }
}
@end

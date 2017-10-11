//
//  ShadowView.m
//  估估信用
//
//  Created by 李想 on 2017/3/9.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "ShadowView.h"

@implementation ShadowView
-(instancetype)initWithFrame:(CGRect)frame ShadowColor:(UIColor*)color OffSet:(CGSize)size Radius:(CGFloat)radiu Opacity:(CGFloat)opacity subViewRadiu:(CGFloat)subRadiu subViewColor:(UIColor*)subColor addSubview:(UIView*)subview{
    if(self=[super initWithFrame:frame]){
        self.frame=frame;
        self.layer.shadowColor=color.CGColor;
        self.layer.shadowOffset=size;
        self.layer.shadowOpacity=opacity;
        self.layer.shadowRadius=radiu;
        
        _subView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _subView.layer.cornerRadius=subRadiu;
        _subView.layer.masksToBounds=YES;
        _subView.backgroundColor=subColor;
        [self addSubview:_subView];
        [_subView addSubview:subview];
        
        [_subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self).with.insets(UIEdgeInsetsZero);
        }];
        [subview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(_subView).with.insets(UIEdgeInsetsZero);
        }];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

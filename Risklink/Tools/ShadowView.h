//
//  ShadowView.h
//  估估信用
//
//  Created by 李想 on 2017/3/9.
//  Copyright © 2017年 李想. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShadowView : UIView
@property(nonatomic,strong)UIView*subView;
-(instancetype)initWithFrame:(CGRect)frame
                 ShadowColor:(UIColor*)color
                      OffSet:(CGSize)size
                      Radius:(CGFloat)radiu
                     Opacity:(CGFloat)opacity
                subViewRadiu:(CGFloat)subRadiu
                subViewColor:(UIColor*)subColor
                  addSubview:(UIView*)subview;
@end

//
//  UIView+GuGu.m
//  估估信用
//
//  Created by 王晟骏 on 2017/3/28.
//  Copyright © 2017年 李想. All rights reserved.
//

#import "UIView+GuGu.h"

@implementation UIView (GuGu)

- (void)setCommonShadow {
    
    [self setCustomShadowWithColor:[UIColor lightGrayColor]
                            offset:CGSizeMake(2, 2)
                           opacity:0.7
                            radius:2];
    
}

- (void)setCustomShadowWithColor:(UIColor *)color
                          offset:(CGSize)offset
                         opacity:(CGFloat)opacity
                          radius:(CGFloat)radius {
    
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
    
}

- (void)setCommonRadius {
    
    self.layer.cornerRadius = 5.0f;
    
}

- (void)setCommonUpRadius {
    
    [self setCommonRadiusOfRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight];
    
}

- (void)setCommonDownRadius {
    
    [self setCommonRadiusOfRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight];
    
}

- (void)setCommonRadiusOfRoundingCorners:(UIRectCorner)rectCorner {
    
    [self setCornerRadius:5.0f ofRoundingCorners:rectCorner];
    
}

- (void)setCornerRadius:(CGFloat)radius ofRoundingCorners:(UIRectCorner)rectCorner {
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = bezierPath.CGPath;
    self.layer.mask = maskLayer;
    
}

- (void)setCommonBorder {
    
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
}

- (void)setUnVerifiedBorder {
    
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor orangeColor].CGColor;
    self.layer.cornerRadius = 5.0f;
    
}

- (void)setInnerQRCodeImageBorder {
    
    self.layer.borderWidth = 3.0f;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.cornerRadius = 5.0f;
    
}

- (void)setGenerateWordBorder {
    
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = navbg.CGColor;
    self.layer.cornerRadius = 5.0f;
    
}

- (void)setBoxViewBorder {
    
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = darkColor.CGColor;
    
}

- (void)setBoxViewButtonBorder {
    
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = bgColor.CGColor;
    
}

- (void)setStatusVerifiedBorder {
    
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.layer.cornerRadius = 5.0f;
    
}

- (void)setStatusUnverifiedBorder {
    
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.cornerRadius = 5.0f;
    
}

- (void)setCardDetailPortraitBorder {
    
    self.layer.cornerRadius = 30.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.masksToBounds = YES;
    self.layer.masksToBounds=YES;
    self.backgroundColor=[UIColor whiteColor];
}

- (void)setCardDetailBigButtonCorner {
    
    self.layer.cornerRadius = 10.0f;
    
}

@end

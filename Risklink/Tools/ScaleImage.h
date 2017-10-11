//
//  ScaleImage.h
//  3Abiz_IOS
//
//  Created by zhengwan on 16/9/22.
//  Copyright © 2016年 zhengwan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ScaleImage : NSObject
+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+(UIImage*)compressedImageFiles:(UIImage *)image
                     imageKB:(CGFloat)fImageKBytes;
+(UIImage *)drawWithWithImage:(UIImage *)imageCope width:(CGFloat)dWidth height:(CGFloat)dHeight;
@end

//
//  ScaleImage.m
//  3Abiz_IOS
//
//  Created by zhengwan on 16/9/22.
//  Copyright © 2016年 zhengwan. All rights reserved.
//

#import "ScaleImage.h"

@implementation ScaleImage
+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
+(UIImage*)compressedImageFiles:(UIImage *)image
                        imageKB:(CGFloat)fImageKBytes
{
    
    __block UIImage *imageCope = image;
    CGFloat fImageBytes = fImageKBytes * 1024;//需要压缩的字节Byte
    
    __block NSData *uploadImageData = nil;
    
    uploadImageData = UIImagePNGRepresentation(imageCope);
    NSLog(@"图片压前缩成 %fKB",uploadImageData.length/1024.0);
    CGSize size = imageCope.size;
    CGFloat imageWidth = size.width;
    CGFloat imageHeight = size.height;
    
    if (uploadImageData.length > fImageBytes && fImageBytes >0) {
        /* 宽高的比例 **/
        CGFloat ratioOfWH = imageWidth/imageHeight;
        /* 压缩率 **/
        CGFloat compressionRatio = fImageBytes/uploadImageData.length;
        /* 宽度或者高度的压缩率 **/
        CGFloat widthOrHeightCompressionRatio = sqrt(compressionRatio);
        
        CGFloat dWidth   = imageWidth *widthOrHeightCompressionRatio;
        CGFloat dHeight  = imageHeight*widthOrHeightCompressionRatio;
        if (ratioOfWH >0) { /* 宽 > 高,说明宽度的压缩相对来说更大些 **/
            dHeight = dWidth/ratioOfWH;
        }else {
            dWidth  = dHeight*ratioOfWH;
        }
        
        imageCope = [self drawWithWithImage:imageCope width:dWidth height:dHeight];
        uploadImageData = UIImagePNGRepresentation(imageCope);
        
        NSLog(@"当前的图片已经压缩成 %fKB",uploadImageData.length/1024.0);
        //微调
        NSInteger compressCount = 0;
        /* 控制在 1M 以内**/
        while (fabs(uploadImageData.length - fImageBytes) > 1024) {
            /* 再次压缩的比例**/
            CGFloat nextCompressionRatio = 0.9;
            
            if (uploadImageData.length > fImageBytes) {
                dWidth = dWidth*nextCompressionRatio;
                dHeight= dHeight*nextCompressionRatio;
            }else {
                dWidth = dWidth/nextCompressionRatio;
                dHeight= dHeight/nextCompressionRatio;
            }
            
            imageCope = [self drawWithWithImage:imageCope width:dWidth height:dHeight];
            uploadImageData = UIImagePNGRepresentation(imageCope);
            
            /*防止进入死循环**/
            compressCount ++;
            if (compressCount == 10) {
                break;
            }
            
        }
        
        NSLog(@"图片已经压缩成 %fKB",uploadImageData.length/1024.0);
        imageCope = [[UIImage alloc] initWithData:uploadImageData];
        NSLog(@"info = %@",imageCope);
        return imageCope;
    }
    else
    {
        return imageCope;
    }
}
+(UIImage *)drawWithWithImage:(UIImage *)imageCope width:(CGFloat)dWidth height:(CGFloat)dHeight
{
    
    UIGraphicsBeginImageContext(CGSizeMake(dWidth, dHeight));
    [imageCope drawInRect:CGRectMake(0, 0, dWidth, dHeight)];
    imageCope = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCope;
    
}
@end

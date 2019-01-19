//
//  UIImage+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (PX)

/**
 根据颜色返回图片

 @param color 图片颜色
 */
+ (UIImage *)px_imageFromColor:(nonnull UIColor *)color;

/**
 根据颜色返回图片

 @param color 图片颜色
 @param size 图片大小
 */
+ (UIImage *)px_imageFromColor:(nonnull UIColor *)color size:(CGSize)size;

/**
 拉伸图片

 @param image 要拉伸的图片
 @param leftCap 宽度缩放系数
 @param topCap 高度缩放系数
 @return 拉伸后的图片
 */
+ (UIImage *)px_resizeWithImage:(UIImage *)image leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;

/**
 拉伸图片
 
 @param leftCap 宽度缩放系数
 @param topCap 高度缩放系数
 @return 拉伸后的图片
 */
- (UIImage *)px_resizeImageWithLeftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;

/**
 给图片施加水印图片

 @param waterImage 水印图片
 @param waterRect 水印范围
 @return 水印后的图片
 */
- (UIImage *)px_imageWaterWithWaterImage:(UIImage *)waterImage waterFrame:(CGRect)waterRect;

/**
 给图片施加水印文字

 @param waterText 水印文字
 @param waterTextColor 水印文字颜色
 @param waterTextFont 水印文字字体
 @param waterRect 水印范围
 @return 水印后的图片
 */
- (UIImage *)px_imageWaterWithWaterText:(NSString *)waterText waterTextColor:(UIColor *)waterTextColor waterTextFont:(UIFont *)waterTextFont waterFrame:(CGRect)waterRect;


@end

NS_ASSUME_NONNULL_END

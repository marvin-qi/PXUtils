//
//  UIImage+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,PXGradientType) {
    PXGradientTypeTopBottom          = 0,///< 上->下
    PXGradientTypeLeftRight          = 1,///< 左->右
    PXGradientTypeLeftTopRightBottom = 2,///< 左上->右下
    PXGradientTypeLeftBottomRightTop = 3 ///< 左下->右上
};

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
 生成渐变色图片
 
 @param type 渐变方案
 @param size 尺寸
 @param colors 颜色集
 */
+ (UIImage *)px_gradientImageColors:(nonnull NSArray <UIColor *>*)colors size:(CGSize)size gradientType:(PXGradientType)type;

/**
 生成渐变色
 
 @param colors 颜色集
 @param size 尺寸
 @param startPoint 渐变开始点
 @param endPoint 渐变结束点
 */
+ (UIImage *)px_gradientImageColors:(nonnull NSArray <UIColor *>*)colors size:(CGSize)size startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

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

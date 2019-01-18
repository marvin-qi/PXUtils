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

+ (UIImage *)px_imageFromColor:(nonnull UIColor *)color;
+ (UIImage *)px_imageFromColor:(nonnull UIColor *)color size:(CGSize)size;

+ (UIImage *)px_resizeWithImage:(UIImage *)image leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;
- (UIImage *)px_resizeImageWithLeftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;

- (UIImage *)px_imageWaterWithWaterImage:(UIImage *)waterImage waterFrame:(CGRect)waterRect;
- (UIImage *)px_imageWaterWithWaterText:(NSString *)waterText waterTextColor:(UIColor *)waterTextColor waterTextFont:(UIFont *)waterTextFont waterFrame:(CGRect)waterRect;


@end

NS_ASSUME_NONNULL_END

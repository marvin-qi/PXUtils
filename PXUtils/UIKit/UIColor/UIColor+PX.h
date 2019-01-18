//
//  UIColor+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define PXUtilsColorHex(hexString) [UIColor px_colorWithHexString:(hexString)]
#define PXUtilsColorHexAlpha(hexString,alpha) [UIColor px_colorWithHexString:(hexString) alpha:(alpha)]
#define PXUtilsRandomColor [UIColor px_randomColor]
#define PXUtilsColorRgb(red, green, blue)     SPTRGBAColor(red, green, blue, 1.0)
#define PXUtilsColorRgba(red, green, blue, alpha) [UIColor colorWithRed:(red)/255.0 green:(greed)/255.0 blue:(blue)/255.0 alpha:alpha]

@interface UIColor (PX)

+ (UIColor *)px_colorWithHexString:(NSString *)hexString;
+ (UIColor *)px_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (UIColor *)px_colorWithUInt:(UInt32)hexUInt;
+ (UIColor *)px_colorWithUInt:(UInt32)hexUInt alpha:(CGFloat)alpha;

+ (UIColor *)px_randomColor;

- (NSString *)px_colorString;


@end

NS_ASSUME_NONNULL_END

//
//  UIImage+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UIImage+PX.h"

@implementation UIImage (PX)

static NSCache *imageCache;

+ (UIImage *)px_imageFromColor:(UIColor *)color{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageCache = [[NSCache alloc] init];
    });
    UIImage *image = [imageCache objectForKey:color];
    if (image) {
        return image;
    }
    image = [self px_imageFromColor:color size:CGSizeMake(1,1)];
    [imageCache setObject:image forKey:color];
    return image;
}

+ (UIImage *)px_imageFromColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)px_resizeWithImage:(UIImage *)image leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap{
    return [image stretchableImageWithLeftCapWidth:image.size.width * leftCap topCapHeight:image.size.height * topCap];
}

- (UIImage *)px_resizeImageWithLeftCap:(CGFloat)leftCap topCap:(CGFloat)topCap{
    return [self stretchableImageWithLeftCapWidth:self.size.width * leftCap topCapHeight:self.size.height * topCap];
}

+ (UIImage *)px_gradientImageColors:(NSArray <UIColor *>*)colors size:(CGSize)size gradientType:(PXGradientType)type{
    CGPoint startPoint = CGPointMake(0, .5);
    CGPoint endPoint = CGPointMake(1, .5);
    switch (type) {
        case PXGradientTypeTopBottom:
            startPoint = CGPointMake(.5, 0);
            endPoint = CGPointMake(.5, 1);
            break;
        case PXGradientTypeLeftBottomRightTop:
            startPoint = CGPointMake(0, 1);
            endPoint = CGPointMake(1, 0);
            break;
        case PXGradientTypeLeftTopRightBottom:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 1);
            break;
        default:
            startPoint = CGPointMake(0, .5);
            endPoint = CGPointMake(1, .5);
            break;
    }
    return [self px_gradientImageColors:colors size:size startPoint:startPoint endPoint:endPoint];
}

+ (UIImage *)px_gradientImageColors:(NSArray <UIColor *>*)colors size:(CGSize)size startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    startPoint = CGPointMake(startPoint.x * size.width, startPoint.y * size.height);
    endPoint = CGPointMake(endPoint.x * size.width, endPoint.y * size.height);
    NSMutableArray *temp = [NSMutableArray array];
    for(UIColor *c in colors) [temp addObject:(id)c.CGColor];
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace(colors.lastObject.CGColor);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)temp, NULL);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)px_imageWaterWithWaterImage:(UIImage *)waterImage waterFrame:(CGRect)waterRect{
    CGSize size = self.size;
    CGRect rect = (CGRect){CGPointZero,size};
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    [self drawInRect:rect];
    [waterImage drawInRect:waterRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)px_imageWaterWithWaterText:(NSString *)waterText
                         waterTextColor:(UIColor *)waterTextColor
                          waterTextFont:(UIFont *)waterTextFont
                             waterFrame:(CGRect)waterRect
{
    CGSize size = self.size;
    CGRect rect = (CGRect){CGPointZero,size};
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    [self drawInRect:rect];
    NSDictionary *attr =@{NSFontAttributeName : waterTextFont,NSForegroundColorAttributeName:waterTextColor};
    [waterText drawInRect:rect withAttributes:attr];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

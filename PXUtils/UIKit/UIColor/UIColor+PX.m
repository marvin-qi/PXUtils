//
//  UIColor+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UIColor+PX.h"

@implementation UIColor (PX)

+ (UIColor *)px_colorWithHexString:(NSString *)hexString{
    return [self px_colorWithHexString:hexString alpha:1];
}

+ (UIColor *)px_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{
    //删除字符串中的空格
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6){
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]){//如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
        cString = [cString substringFromIndex:2];
    }
    
    if ([cString hasPrefix:@"#"]){//如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return [UIColor clearColor];
    }
    
    NSString *rString = [cString substringWithRange:NSMakeRange(0, 2)];///< r
    NSString *gString = [cString substringWithRange:NSMakeRange(2, 2)];///< g
    NSString *bString = [cString substringWithRange:NSMakeRange(4, 2)];///< b
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

+ (UIColor *)px_colorWithUInt:(UInt32)hexUInt{
    return [self px_colorWithUInt:hexUInt alpha:1.f];
}

+ (UIColor *)px_colorWithUInt:(UInt32)hexUInt alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((hexUInt >> 16) & 0xFF)/255.0
                           green:((hexUInt >> 8) & 0xFF)/255.0
                            blue:(hexUInt & 0xFF)/255.0
                           alpha:alpha];
}

+ (UIColor *)px_randomColor{
    return [UIColor colorWithRed:(arc4random() % 255) / 255.0f green:(arc4random() % 255) / 255.0f blue:(arc4random() % 255) / 255.0f alpha:1.0f];
}

- (NSString *)px_colorString{
    UIColor* color = self;
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}

@end

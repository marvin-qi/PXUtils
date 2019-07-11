//
//  UIView+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UIView+PX.h"

@implementation UIView (PX)

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (UIViewController *)viewController{
    for (UIView *view = self; view; view = view.superview) {
        if ([view.nextResponder isKindOfClass:UIViewController.class]) {
            return (UIViewController *)view.nextResponder;
        }
    }
    return nil;
}

+ (instancetype)px_viewWithColor:(UIColor *)color{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color?:[UIColor whiteColor];
    return view;
}

- (void)px_addSubViews:(NSArray<UIView *> *)views{
    for (UIView *view in views) {
        [self addSubview:view];
    }
}

- (void)px_removeSubViews:(NSArray<UIView *> *)views{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView *view in views) {
            [view removeFromSuperview];
        }
    });
}

- (void)px_addBorderColor:(UIColor *)borderColor
              borderWidth:(CGFloat)borderWidth
             cornerRadius:(CGFloat)cornerRadius{
    self.layer.masksToBounds = TRUE;
    self.layer.borderColor = (borderColor?:[UIColor clearColor]).CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = cornerRadius;
}

- (UIImage *)px_cutImage{
    return [self px_cutImageWithFrame:self.frame];
}

- (UIImage *)px_cutImageWithFrame:(CGRect)frame{
    int scale = [UIScreen mainScreen].scale;
    CGRect rect = frame;
    rect.origin.x *= scale;
    rect.origin.y *= scale;
    rect.size.width *= scale;
    rect.size.height *= scale;
    
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRef cgImage = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIImage * newImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return newImage;
}

- (void)px_removeAllSubviews{
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

@end

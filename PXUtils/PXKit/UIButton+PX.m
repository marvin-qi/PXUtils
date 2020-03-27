//
//  UIButton+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UIButton+PX.h"
#import "UIImage+PX.h"

@implementation UIButton (PX)

+ (instancetype)px_buttonWithTitle:(nullable NSString *)title
                         titleFont:(nullable UIFont *)titleFont
                        titleColor:(nullable UIColor *)titleColor
                   backgroundColor:(nullable UIColor *)backgroundColor
                            target:(nullable id)target
                            action:(SEL)action
{
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) [view setTitle:title forState:UIControlStateNormal];
    if (titleFont) view.titleLabel.font = titleFont;
    if (titleColor) [view setTitleColor:titleColor forState:UIControlStateNormal];
    if (backgroundColor) view.backgroundColor = backgroundColor;
    if (target) {
        [view addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return view;
}

- (void)px_buttonType:(PXButtonType)type image:(UIImage *)image title:(NSString *)title space:(CGFloat)space{
    [self px_buttonType:type image:image title:title state:UIControlStateNormal space:space];
}

- (void)px_buttonType:(PXButtonType)type imageName:(NSString *)imageName title:(NSString *)title space:(CGFloat)space{
    [self px_buttonType:type image:[UIImage imageNamed:imageName] title:title space:space];
}

- (void)px_buttonType:(PXButtonType)type image:(UIImage *)image title:(NSString *)title state:(UIControlState)state space:(CGFloat)space{
    [self setImage:image forState:state];
    [self setTitle:title forState:state];
    [self px_buttonType:type space:space];
}

- (void)px_buttonType:(PXButtonType)type space:(CGFloat)space{
    switch (type) {
        case PXButtonTypeTopImage:
            [self topImage:space];
            break;
        case PXButtonTypeLeftImage:
            [self leftImage:space];
            break;
        case PXButtonTypeRightImage:
            [self rightImage:space];
            break;
        case PXButtonTypeBottomImage:
            [self bottomImage:space];
            break;
        default:
            NSAssert(TRUE, @"请设置正确的样式");
            break;
    }
}

- (void)px_setBackgroundColor:(UIColor *)color state:(UIControlState)state{
    [self setBackgroundImage:[UIImage px_imageFromColor:color] forState:state];
}

- (void)topImage:(CGFloat)space{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + space);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
}

- (void)leftImage:(CGFloat)space{
    self.titleEdgeInsets = UIEdgeInsetsMake(0, space, 0, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, space);
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

- (void)rightImage:(CGFloat)space{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + space/2, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, imageSize.width + space/2);
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

- (void)bottomImage:(CGFloat)space{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    self.titleEdgeInsets = UIEdgeInsetsMake(- (imageSize.height + space+space), - imageSize.width, 0, 0);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, - (titleSize.height), - titleSize.width);
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}

@end

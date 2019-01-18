//
//  UIButton+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PXButtonType) {
    PXButtonTypeTopImage    = 0,///< 图片在上，文字在下
    PXButtonTypeLeftImage   = 1,///< 图片在左，文字在右
    PXButtonTypeRightImage  = 2,///< 图片在右，文字在左
    PXButtonTypeBottomImage = 3 ///< 图片在下，文字在上
};

@interface UIButton (PX)

+ (instancetype)px_buttonWithTitle:(nullable NSString *)title
                         titleFont:(nullable UIFont *)titleFont
                        titleColor:(nullable UIColor *)titleColor
                   backgroundColor:(nullable UIColor *)backgroundColor
                            target:(nullable id)target
                            action:(SEL)action;

- (void)px_setImageWithUrl:(NSString *)url placeholder:(UIImage *)placeholder state:(UIControlState)state;
- (void)px_setImageWithUrl:(NSString *)url placeholder:(UIImage *)placeholder;
- (void)px_setImageWithUrl:(NSString *)url placeholderName:(NSString *)placeholderName;

- (void)px_buttonType:(PXButtonType)type image:(UIImage *)image title:(NSString *)title space:(CGFloat)space;
- (void)px_buttonType:(PXButtonType)type imageName:(NSString *)imageName title:(NSString *)title space:(CGFloat)space;
- (void)px_buttonType:(PXButtonType)type image:(UIImage *)image title:(NSString *)title state:(UIControlState)state space:(CGFloat)space;
- (void)px_buttonType:(PXButtonType)type space:(CGFloat)space;

- (void)px_setBackgroundColor:(UIColor *)color state:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END

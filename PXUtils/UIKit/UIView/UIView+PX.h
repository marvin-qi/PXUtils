//
//  UIView+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (PX)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;

/**
 返回一个带颜色的view

 @param color view的颜色,默认white
 */
+ (instancetype)px_viewWithColor:(nullable UIColor *)color;

- (void)px_addSubViews:(nonnull NSArray <UIView *>*)views;

- (void)px_removeSubViews:(nonnull NSArray <UIView *>*)views;

- (void)px_addBorderColor:(nullable UIColor *)borderColor
              borderWidth:(CGFloat)borderWidth
             cornerRadius:(CGFloat)cornerRadius;

- (UIImage *)px_cutImage;

- (UIImage *)px_cutImageWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END

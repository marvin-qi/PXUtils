//
//  UITextField+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (PX)

@property (nonatomic, retain) UIColor *placeholderColor;

@property (nonatomic, assign) BOOL isMobileTextField;///< 是否是手机号码输入框
@property (nonatomic, readonly, assign) BOOL isMobile;///< 输入的文字是否是手机号码
@property (nonatomic,assign) NSUInteger maxLength;///< 最大长度,0为不限制长度

/**
 限制最大长度

 @param maxLength 最大长度
 */
- (void)px_limitMaxLength:(NSUInteger)maxLength;

@end

NS_ASSUME_NONNULL_END

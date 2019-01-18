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

@property (nonatomic,retain) UIColor *placeholderColor;

/**
 限制最大长度

 @param maxLength 最大长度
 */
- (void)px_limitMaxLength:(NSUInteger)maxLength;

@end

NS_ASSUME_NONNULL_END

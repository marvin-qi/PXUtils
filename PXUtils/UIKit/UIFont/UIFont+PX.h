//
//  UIFont+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define PXUtilsFont(fontSize) [UIFont systemFontOfSize:(fontSize)]
#define PXUtilsBoldFont(fontSize) [UIFont boldSystemFontOfSize:(fontSize)]
#define PXUtilsMicrosoftFont(fontSize) [UIFont px_microsoftYaHeiFontOfSize:(fontSize)]

@interface UIFont (PX)

/**
 显示所有字体
 */
+ (void)px_showAllFonts;

/**
 微软雅黑字体

 @param fontSize 字号
 */
+ (UIFont *)px_microsoftYaHeiFontOfSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END

//
//  NSString+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (PX)

@property (nonatomic, readonly, assign) BOOL isMobile;///< 是否是手机号码
@property (nonatomic, readonly, assign) BOOL isEmaile;///< 是否是电子邮箱
@property (nonatomic, readonly, assign) BOOL isIdNumberNormal;///< 是否是身份证号码,普通校验
@property (nonatomic, readonly, assign) BOOL isIdNumber;///< 是否是身份证号码,精度校验
@property (nonatomic, readonly, assign) BOOL isPassword;///< 校验是否是6-16位字母数字组合密码

- (BOOL)checkMobile;///< 校验是否为手机号码
- (BOOL)checkEmaile;///< 校验是否为电子邮箱
- (BOOL)checkIdNumberNormal;///< 校验是否为身份证号码，普通校验
- (BOOL)checkIdNumber;///< 校验是否为身份证号码，精度校验
- (BOOL)checkPassword;///< 校验是否是6-16位字母数字组合密码


- (CGFloat)px_getWidthWithFont:(UIFont *)font maxHeight:(CGFloat)maxHeight;
- (CGFloat)px_getHeightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;

- (CGSize)px_getSizeWihFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END

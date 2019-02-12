//
//  NSString+Security.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/21.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Security)

@property (nonatomic, readonly, copy) NSString *md5;///< md5加密
@property (nonatomic, readonly, copy) NSString *base64;///< base64加密
@property (nonatomic, readonly, copy) NSString *urlEncode;///< urlEncode

#pragma mark - Encode and decode

+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64Encoded;

- (NSString *)stringByURLDecode;

@end

NS_ASSUME_NONNULL_END

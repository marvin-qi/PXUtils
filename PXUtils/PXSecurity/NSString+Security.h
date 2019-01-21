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

#pragma mark - Hash

- (nullable NSString *)md5;

#pragma mark - Encode and decode

- (nullable NSString *)base64Encoded;

+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64Encoded;

- (NSString *)stringByURLEncode;

- (NSString *)stringByURLDecode;

@end

NS_ASSUME_NONNULL_END

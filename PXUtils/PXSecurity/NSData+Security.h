//
//  NSData+Security.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/21.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Security)

#pragma mark - Hash

- (NSString *)md5String;

- (NSData *)md5Data;

#pragma mark - Encode and decode

- (nullable NSString *)base64EncodedString;

+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

@end

NS_ASSUME_NONNULL_END

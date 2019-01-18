//
//  NSArray+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (PX)

/**
 数组交集
 @param array 另外一个数组
 @return 交集数组
 */
- (NSArray *)px_arrayForIntersectionWithOtherArray:(NSArray *)array;


/**
 数组差集
 @param array 另外一个数组
 @return 差集数组
 */
- (NSArray *)px_arrayForMinusWithOtherArray:(NSArray *)array;


/**
 数组并集
 @param array 另外一个数组
 @return 数组并集
 */
- (NSArray *)px_arrayForUnionWithOtherArray:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END

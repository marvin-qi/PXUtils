//
//  NSArray+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "NSArray+PX.h"

@implementation NSArray (PX)

- (NSArray *)px_arrayForIntersectionWithOtherArray:(NSArray *)array{
    if(self.count == 0) return nil;
    if(array == nil) return nil;
    NSMutableArray *intersectionArray=[NSMutableArray array];
    for (id obj in self) {//遍历
        if(![array containsObject:obj]) continue;
        [intersectionArray addObject:obj];//添加
    }
    return intersectionArray;
}

- (NSArray *)px_arrayForMinusWithOtherArray:(NSArray *)array{
    if(self.count == 0) return nil;
    if(array == nil) return self;
    NSMutableArray *minusArray=[NSMutableArray arrayWithArray:self];
    for (id obj in array) {//遍历
        if(![self containsObject:obj]) continue;
        [minusArray removeObject:obj];//移除
    }
    return minusArray;
}

- (NSArray *)px_arrayForUnionWithOtherArray:(NSArray *)array{
    if (self.count == 0) return nil;
    if (array == nil) return self;
    NSMutableArray *unionArray = [NSMutableArray arrayWithArray:self];
    for (id obj in array) {
        if ([self containsObject:obj]) continue;
        [unionArray addObject:obj];
    }
    return unionArray;
}

@end

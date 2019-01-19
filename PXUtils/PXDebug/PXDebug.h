//
//  PXDebug.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/19.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#if DEBUG
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PXDebug : NSObject

@property (nonatomic, readonly, strong) UILabel *vcLabel;

+ (instancetype)debug;
- (void)px_start;
- (void)px_end;

@end

NS_ASSUME_NONNULL_END
#endif

//
//  User.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/18.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXUtils.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic,assign) BOOL isLogin;

PXUtilsSingletonH(Instance);

@end

NS_ASSUME_NONNULL_END

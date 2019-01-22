//
//  UIImageView+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (PX)

- (void)px_setImageWithUrl:(NSString *)url placeholder:(nullable UIImage *)placeholder;
- (void)px_setImageWithUrl:(NSString *)url placeholderName:(nonnull NSString *)placeholderName;

@end

NS_ASSUME_NONNULL_END

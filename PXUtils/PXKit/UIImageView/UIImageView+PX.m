//
//  UIImageView+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UIImageView+PX.h"
#import "YYWebImage.h"

@implementation UIImageView (PX)

- (void)px_setImageWithUrl:(NSString *)url placeholder:(UIImage *)placeholder{
    [self yy_setImageWithURL:[NSURL URLWithString:url] placeholder:placeholder];
}

- (void)px_setImageWithUrl:(NSString *)url placeholderName:(nullable NSString *)placeholderName{
    [self px_setImageWithUrl:url placeholder:[UIImage imageNamed:placeholderName]];
}

@end

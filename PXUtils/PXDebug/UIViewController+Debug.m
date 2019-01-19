//
//  UIViewController+Debug.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/19.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#if DEBUG
#import "UIViewController+Debug.h"
#import "PXUtilsMacros.h"
#import "PXDebug.h"
#import <objc/runtime.h>

@implementation UIViewController (Debug)

+ (void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self, NSSelectorFromString(@"dealloc")), class_getInstanceMethod(self, @selector(pxDealloc)));
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewWillAppear:)), class_getInstanceMethod(self, @selector(pxViewWillAppear:)));
    });
}

- (void)pxDealloc{
    PXUtilsLog(@"===>>> %@ 已经释放了 <<<===",[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject);
    [self pxDealloc];
}

- (void)pxViewWillAppear:(BOOL)animated{
    if (![self isPrivateViewController]) {
        UILabel *vcLabel = PXDebug.debug.vcLabel;
        if (vcLabel.superview) {
            [vcLabel.superview bringSubviewToFront:vcLabel];
        }
        NSString *vc = [NSStringFromClass(self.class)componentsSeparatedByString:@"."].lastObject;
        vcLabel.text = [NSString stringWithFormat:@"VC:%@",vc];
    }
    [self pxViewWillAppear:animated];
}

- (BOOL)isPrivateViewController{
    NSString * selfClass = NSStringFromClass(self.class);
    return [selfClass isEqualToString:@"UIAlertController"] ||
    [selfClass isEqualToString:@"_UIAlertControllerTextFieldViewController"] ||
    [selfClass isEqualToString:@"UIApplicationRotationFollowingController"] ||
    [selfClass isEqualToString:@"UIInputWindowController"];
}

@end
#endif

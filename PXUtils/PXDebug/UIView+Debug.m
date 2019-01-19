//
//  UIView+Debug.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/19.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#if DEBUG
#import "UIView+Debug.h"
#import "PXUtilsMacros.h"
#import "UIView+PX.h"
#import <objc/runtime.h>

@implementation UIView (Debug)

+ (void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(setNeedsDisplay)), class_getInstanceMethod(self, @selector(pxSetNeedsDisplay)));
    });
}

- (void)pxSetNeedsDisplay{
    if (NSThread.currentThread != NSThread.mainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString * note = [NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject;
            NSString * msg = [NSString stringWithFormat:@"警告!!!%@未在主线程操作UI!!!",note];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:msg preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self.viewController presentViewController:alert animated:TRUE completion:nil];
            PXUtilsLog(@">>>>>>>>>%@<<<<<<<<<",msg);
        });
    }
    [self pxSetNeedsDisplay];
}

@end
#endif

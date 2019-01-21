//
//  PXDebug.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/19.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#if DEBUG

#if !__has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import "PXDebug.h"
#import "PXUtilsMacros.h"
#import "PXUtilsConstInline.h"

@interface PXDebug ()
@property (nonatomic, readwrite, strong) UILabel *vcLabel;
@property (nonatomic,strong) UILabel *fpsLabel;
@property (nonatomic,strong) CADisplayLink *displayLink;
@property (nonatomic,assign) NSTimeInterval lastTime;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,assign) BOOL isStart;

@end

@implementation PXDebug

static PXDebug *instance = nil;

+ (instancetype)debug{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[super alloc] init];
            instance.isStart = FALSE;
        }
    });
    return instance;
}

+ (void)load{
    [super load];
    [self debug];
}

- (void)displayLinkFire:(CADisplayLink *)link{
    if (self.lastTime == 0) {
        self.lastTime = link.timestamp;
        return;
    }
    self.count++;
    NSTimeInterval interval = link.timestamp - self.lastTime;
    if (interval < 1.f) return;
    self.lastTime = link.timestamp;
    NSInteger fps = (NSInteger)round(self.count/interval);
    self.fpsLabel.text = [NSString stringWithFormat:@"%@ FPS",@(fps)];
    if (fps < 20) self.fpsLabel.textColor = [UIColor magentaColor];
    else if (fps < 40) self.fpsLabel.textColor = [UIColor redColor];
    else if (fps < 50) self.fpsLabel.textColor = [UIColor orangeColor];
    else self.fpsLabel.textColor = [UIColor greenColor];
    self.count = 0;
}

- (void)px_start{
    if (self.isStart) {
        return;
    }
    
#if !DEBUG
    return;
#endif
    
#if TARGET_OS_SIMULATOR
    self.fpsLabel.text = @"60 FPS";
    self.fpsLabel.textColor = [UIColor greenColor];
    return;
#endif
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunreachable-code"
    self.displayLink.paused = FALSE;
    self.isStart = TRUE;
#pragma clang diagnostic pop
}

- (void)px_end{
    if (self.isStart) {
        [self.displayLink invalidate];
        self.displayLink = nil;
        [self.vcLabel removeFromSuperview];
        self.isStart = NO;
        self.lastTime = 0;
        self.count = 0;
    }
}

- (UILabel *)vcLabel{
    return PXUtilsLazy(_vcLabel, ({
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, PXUtilsStatusBarHeight(), PXUtilsScreenWidth, 20)];
        [PXUtilsApplication.delegate.window addSubview:view];
        view.textColor = [UIColor redColor];
        view.font = PXUtilsFont(15);
        view.backgroundColor = PXUtilsColorHexAlpha(@"000000", .4);
        view;
    }));
}

- (UILabel *)fpsLabel{
    return PXUtilsLazy(_fpsLabel, ({
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(PXUtilsScreenWidth - 100, 0, 100, 20)];
        [self.vcLabel addSubview:view];
        view.font = PXUtilsFont(15);
        view.textAlignment = NSTextAlignmentRight;
        view.backgroundColor = [UIColor clearColor];
        view;
    }));
}

- (CADisplayLink *)displayLink{
    return PXUtilsLazy(_displayLink, ({
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkFire:)];
        [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        link;
    }));
}

@end
#endif

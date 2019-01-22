//
//  PXObject.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "PXObject.h"

@implementation PXObject

+ (void)callMobile:(NSString *)mobile{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",mobile]];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
}

+ (void)jumpToAppSetting{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
}

+ (void)jumpToCommentAppId:(NSString *)appId{
    NSString *urlString = [NSString stringWithFormat:@"https://itunes.apple.com/us/app/itunes-u/id%@?action=write-review&mt=8",appId];
    NSURL *url = [NSURL URLWithString:urlString];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
}

+ (dispatch_source_t)startTimeWithSeconds:(int)seconds completed:(kCompletedSecond)completed{
    __block NSInteger time = seconds;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        time --;
        dispatch_async(dispatch_get_main_queue(), ^{
            if(time <= 0) {
                completed?completed(TRUE,0):nil;
                dispatch_source_cancel(_timer);
            }else completed?completed(FALSE,time%60):nil;
        });
    });
    dispatch_resume(_timer);
    return _timer;
}

+ (CGFloat)distanceBetweenLat1:(CGFloat)lat1 lng1:(CGFloat)lng1 lat2:(CGFloat)lat2 lng2:(CGFloat)lng2{
    CGFloat dd = M_PI/180;
    CGFloat x1=lat1*dd,x2=lat2*dd;
    CGFloat y1=lng1*dd,y2=lng2*dd;
    CGFloat R = 6371004;
    CGFloat distance = (2*R*asin(sqrt(2-2*cos(x1)*cos(x2)*cos(y1-y2) - 2*sin(x1)*sin(x2))/2));
    return distance;
}

@end

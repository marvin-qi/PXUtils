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

+ (CGFloat)distanceBetweenLat1:(CGFloat)lat1 lng1:(CGFloat)lng1 lat2:(CGFloat)lat2 lng2:(CGFloat)lng2{
    CGFloat dd = M_PI/180;
    CGFloat x1=lat1*dd,x2=lat2*dd;
    CGFloat y1=lng1*dd,y2=lng2*dd;
    CGFloat R = 6371004;
    CGFloat distance = (2*R*asin(sqrt(2-2*cos(x1)*cos(x2)*cos(y1-y2) - 2*sin(x1)*sin(x2))/2));
    return distance;
}

+ (NSString *)appName{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}

+ (NSString *)appVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appBuildVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)systemName{
    return [UIDevice currentDevice].systemName;
}

+ (NSString *)systemVersion{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)uuid{
    return [UIDevice currentDevice].identifierForVendor.UUIDString;
}

+ (NSString *)deviceName{
    return [UIDevice currentDevice].name;
}

+ (NSString *)deviceModel{
    return [UIDevice currentDevice].model;
}

+ (NSString *)localizedModel{
    return [UIDevice currentDevice].localizedModel;
}

@end

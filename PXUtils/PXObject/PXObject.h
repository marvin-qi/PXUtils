//
//  PXObject.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PXObject : NSObject

+ (void)callMobile:(nonnull NSString *)mobile;///< 拨打电话

+ (void)jumpToAppSetting;///< 去App设置中心

+ (void)jumpToCommentAppId:(NSString *)appId;///< 去App Store对应App的评论页

/**
 倒计时

 @param seconds 倒计时时间
 @param completed 回调
 */
+ (dispatch_source_t)startTimeWithSeconds:(int)seconds completed:(nullable void(^)(BOOL completed, NSInteger intValue))completed;

/**
 返回两个地理点直接的距离/m

 @param lat1 点1纬度
 @param lng1 点2经度
 @param lat2 点2纬度
 @param lng2 点2经度
 @return 返回距离单位米/m
 */
+ (CGFloat)distanceBetweenLat1:(CGFloat)lat1 lng1:(CGFloat)lng1 lat2:(CGFloat)lat2 lng2:(CGFloat)lng2;

@end

NS_ASSUME_NONNULL_END

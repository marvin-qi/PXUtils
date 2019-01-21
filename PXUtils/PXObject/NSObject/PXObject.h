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

typedef void(^kCompleted)(BOOL completed);///< 仅回调布尔值
typedef void(^kCompletedResponse)(BOOL completed, id _Nullable response);///< 回调一个布尔值和任意内容
typedef void(^kCompletedSecond)(BOOL completed, NSInteger seconds);

@interface PXObject : NSObject

+ (void)callMobile:(nonnull NSString *)mobile;///< 拨打电话

+ (void)jumpToAppSetting;///< 去App设置中心

+ (void)jumpToCommentAppId:(NSString *)appId;///< 去App Store对应App的评论页

/**
 倒计时

 @param seconds 倒计时时间
 @param completed 回调
 */
+ (dispatch_source_t)startTimeWithSeconds:(int)seconds completed:(nullable kCompletedSecond)completed;

/**
 返回两个地理点直接的距离/m

 @param lat1 点1纬度
 @param lng1 点2经度
 @param lat2 点2纬度
 @param lng2 点2经度
 @return 返回距离单位米/m
 */
+ (CGFloat)distanceBetweenLat1:(CGFloat)lat1 lng1:(CGFloat)lng1 lat2:(CGFloat)lat2 lng2:(CGFloat)lng2;

+ (NSString *)appName;///< App名字
+ (NSString *)appVersion;///< App版本号
+ (NSString *)appBuildVersion;///< App Build号
+ (NSString *)systemName;///< 设备名称
+ (NSString *)systemVersion;///< iOS版本
+ (NSString *)uuid;///< UUID
+ (NSString *)deviceName;///< 设备别名
+ (NSString *)deviceModel;///< 设备型号
+ (NSString *)localizedModel;///< 设备地方型号(国际化)

@end

NS_ASSUME_NONNULL_END

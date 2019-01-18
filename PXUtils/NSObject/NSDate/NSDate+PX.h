//
//  NSDate+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (PX)

@property (nonatomic, readonly, assign) NSTimeInterval currentTimeInterval;///< 当前时间戳
@property (nonatomic, readonly, copy) NSString *currentTimeString;///< 当前时间字符串,yyyy-MM-dd HH:mm:ss
@property (nonatomic, readonly, assign) BOOL isToday;///< 是否今天
@property (nonatomic, readonly, assign) BOOL isThisYear;///< 是否今年
@property (nonatomic, readonly, assign) BOOL isYesterday;///< 是否昨天
@property (nonatomic, readonly, assign) BOOL isLeapYear;///< 是否闰年

- (NSInteger)px_getYear;///< 获取年
- (NSInteger)px_getMonth;///< 获取月
- (NSInteger)px_getWeek;///< 获取周几
- (NSString *)px_getWeekString;///< 获取周几字符串
- (NSInteger)px_getDay;///< 获取日
- (NSInteger)px_getHour;///< 获取时
- (NSInteger)px_getMinute;///< 获取钟
- (NSInteger)px_getSecond;///< 获取秒

- (NSInteger)px_getDayInMonth;///< 获取该月有多少天
- (NSInteger)px_getDayOfYear;///< 获取一年中多少天

- (NSInteger)px_getWeeksInMonth;///< 获取月份中有多少周
- (NSInteger)px_getWeeksInYear;///< 获取本周是该年的第几周

- (NSDate *)px_getDateInMonthFirstDay;///< 获取该月第一天日期
- (NSDate *)px_getDateInMonthLasteDay;///< 获取该月最后一天日期

- (NSDate *)px_getDateAfterDay:(NSInteger)days;///< 获取days天后的日期，负数为前
- (NSDate *)px_getDateAfterMonth:(NSInteger)months;///< 获取months月后的日期，负数为前
- (NSDate *)px_getDateAfterYear:(NSInteger)years;///< 获取years年后的日期，负数为前

/**
 时间戳转时间字符串
 
 @param timeStamp 时间戳
 @param formatter 时间格式，默认YYYY-MM-dd
 */
+ (NSString *)px_timeStringFromStamp:(NSTimeInterval)timeStamp formatter:(nullable NSString *)formatter;

/**
 时间转时间字符串
 
 @param date 时间
 @param formatter 时间格式，默认YYYY-MM-dd
 */
+ (NSString *)px_timeStringFromDate:(NSDate *)date formatter:(NSString *)formatter;

/**
 时间字符串转时间戳
 
 @param timeString 时间字符串,必须是年月日时分秒都有的
 */
+ (NSTimeInterval)px_timeStampFromString:(NSString *)timeString;

/**
 时间转时间戳
 
 @param date 时间
 */
+ (NSTimeInterval)px_timeStampFromDate:(NSDate *)date;

/**
 时间字符串转时间

 @param timeString 时间字符串,必须是年月日时分秒都有的
 */
+ (NSDate *)px_dateFromTimeString:(NSString *)timeString;

/**
 时间戳转时间

 @param timeStamp 时间戳
 */
+ (NSDate *)px_dateFromTimeStamp:(NSTimeInterval )timeStamp;

/**
 获取两个时间直接的秒差

 @param beginDate 开始时间
 @param endDate 结束时间
 */
+ (NSInteger)px_secondesBeginDate:(NSDate*)beginDate  endDate:(NSDate*)endDate;

/**
 根据生日，推算年龄

 @param date 生日
 */
+ (NSInteger)px_getAgeByBirthDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END

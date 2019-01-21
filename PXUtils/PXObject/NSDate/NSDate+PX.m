//
//  NSDate+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "NSDate+PX.h"

@interface NSDate ()
@property (nonatomic,strong) NSDateComponents *components;
@end

@implementation NSDate (PX)

- (NSDateComponents *)components{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSCalendarUnit unit=NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self];
}

- (NSTimeInterval)currentTimeInterval{
    return (NSInteger)[self timeIntervalSince1970];
}

- (NSString *)currentTimeString{
    return [NSDate px_timeStringFromStamp:self.currentTimeInterval formatter:@"yyyy-MM-dd HH:mm:ss"];
}

- (BOOL)isToday{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    BOOL isToday = [[NSCalendar currentCalendar] isDateInToday:self];
    return isToday;
}

- (BOOL)isYesterday{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    return [[NSCalendar currentCalendar] isDateInYesterday:self];
}

- (BOOL)isThisYear{
    NSDateComponents *dateComponents=self.components;
    NSDateComponents *nowComponents=[NSDate date].components;
    return dateComponents.year==nowComponents.year;
}

- (BOOL)isLeapYear{
    NSInteger year = [self px_getYear];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0)
        return TRUE;
    return FALSE;
}

- (NSInteger)px_getYear{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitYear fromDate:self].year;
}

- (NSInteger)px_getMonth{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitMonth fromDate:self].month;
}

- (NSInteger)px_getWeek{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitWeekday fromDate:self].weekday;
}

- (NSString *)px_getWeekString{
    NSInteger week = [self px_getWeek] - 1;
    NSArray *weeks = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    return weeks[week];
}

- (NSInteger)px_getDay{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitDay fromDate:self].day;
}

- (NSInteger)px_getHour{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitHour fromDate:self].hour;
}

- (NSInteger)px_getMinute{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitMinute fromDate:self].minute;
}

- (NSInteger)px_getSecond{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:NSCalendarUnitSecond fromDate:self].second;
}

- (NSInteger)px_getDayInMonth{
    NSInteger month = [self px_getMonth];
    switch (month) {
        case 4: case 6: case 9: case 11:
            return 30;
            break;
        case 2:
            if (self.isLeapYear) return 29;
            return 28;
            break;
        default:
            return 31;
            break;
    }
}

- (NSInteger)px_getDayOfYear{
    if (self.isLeapYear)
        return 366;
    return 365;
}

- (NSInteger)px_getWeeksInMonth{
    return [[self px_getDateInMonthLasteDay] px_getWeeksInYear] - [[self px_getDateInMonthFirstDay] px_getWeeksInYear] + 1;
}

- (NSInteger)px_getWeeksInYear{
    NSUInteger i;
    NSUInteger year = [self px_getYear];
    NSDate *lastdate = [self px_getDateInMonthLasteDay];
    for (i = 1;[[lastdate px_getDateAfterDay:-7 * i] px_getYear] == year; i++) {}
    return i;
}

- (NSDate *)px_getDateInMonthFirstDay{
    return [self px_getDateAfterDay:1 - [self px_getDay]];
}

- (NSDate *)px_getDateInMonthLasteDay{
    NSDate *firstDate = [self px_getDateInMonthFirstDay];
    return [[firstDate px_getDateAfterMonth:1] px_getDateAfterDay:-1];
}

- (NSDate *)px_getDateAfterDay:(NSInteger)days{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:days];
    NSDate *afterDate = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    return afterDate;
}

- (NSDate *)px_getDateAfterMonth:(NSInteger)months{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:months];
    NSDate *afterDate = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    return afterDate;
}

- (NSDate *)px_getDateAfterYear:(NSInteger)years{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setYear:years];
    NSDate *afterDate = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    return afterDate;
}

+ (NSString *)px_timeStringFromStamp:(NSTimeInterval)timeStamp formatter:(NSString *)formatter{
    formatter = formatter?:@"MM-dd HH:mm";
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    [formate setDateFormat:formatter];
    NSString *dateString       = [formate stringFromDate:date];
    return dateString;
}

+ (NSString *)px_timeStringFromDate:(NSDate *)date formatter:(NSString *)formatter{
    formatter = formatter?:@"MM-dd HH:mm";
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    [formate setDateFormat:formatter];
    return [formate stringFromDate:date];
}

+ (NSTimeInterval)px_timeStampFromString:(NSString *)timeString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate* date = [formatter dateFromString:timeString];
    return [date timeIntervalSince1970];
}

+ (NSTimeInterval)px_timeStampFromDate:(NSDate *)date{
    return date.currentTimeInterval;
}

+ (NSDate *)px_dateFromTimeString:(NSString *)timeString{
    return [NSDate dateWithTimeIntervalSince1970:[self px_timeStampFromString:timeString]];
}

+ (NSDate *)px_dateFromTimeStamp:(NSTimeInterval)timeStamp{
    return [self dateWithTimeIntervalSince1970:timeStamp];
}

+ (NSInteger)px_secondesBeginDate:(NSDate *)beginDate endDate:(NSDate *)endDate{
    return (NSInteger)(beginDate.currentTimeInterval - endDate.currentTimeInterval);
}

+ (NSInteger)px_getAgeByBirthDate:(NSDate *)date{
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    return iAge;
}

@end

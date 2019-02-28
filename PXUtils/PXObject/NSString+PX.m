//
//  NSString+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "NSString+PX.h"

@implementation NSString (PX)

- (BOOL)isMobile{
    return [self checkMobile];
}

- (BOOL)isEmaile{
    return [self checkEmaile];
}

- (BOOL)isIdNumberNormal{
    return [self checkIdNumberNormal];
}

- (BOOL)isIdNumber{
    return [self checkIdNumber];
}

- (BOOL)isPassword{
    return [self checkPassword];
}

- (NSRange)rangOfAll{
    return NSMakeRange(0, self.length);
}

- (BOOL)checkMobile{
    NSString *phoneRegex = @"^1([3-9][0-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)checkEmaile{
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [pre evaluateWithObject:self];
}

- (BOOL)checkIdNumberNormal{
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [pre evaluateWithObject:self];
}

- (BOOL)checkIdNumber{
    NSString *idnum = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger length =self.length;
    if (length!=15&&length!=18) {
        return NO;
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41",@"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    NSString *valueStart2 = [idnum substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    if (!areaFlag) {
        return NO;
    }
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    int year =0;
    if (length==15) {
        year = [idnum substringWithRange:NSMakeRange(6,2)].intValue +1900;
        if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
            regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
        }else {
            regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
        }
        numberofMatch = [regularExpression numberOfMatchesInString:idnum options:NSMatchingReportProgress range:NSMakeRange(0, idnum.length)];
        if(numberofMatch >0) {
            return YES;
        }else {
            return NO;
        }
    }else if(length == 18){
        year = [idnum substringWithRange:NSMakeRange(6,4)].intValue;
        if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
            regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
        }else {
            regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
        }
        numberofMatch = [regularExpression numberOfMatchesInString:idnum options:NSMatchingReportProgress range:NSMakeRange(0, idnum.length)];
        if(numberofMatch >0) {
            int S = ([idnum substringWithRange:NSMakeRange(0,1)].intValue +
                     [idnum substringWithRange:NSMakeRange(10,1)].intValue) *7 +
            ([idnum substringWithRange:NSMakeRange(1,1)].intValue +
             [idnum substringWithRange:NSMakeRange(11,1)].intValue) *9 +
            ([idnum substringWithRange:NSMakeRange(2,1)].intValue +
             [idnum substringWithRange:NSMakeRange(12,1)].intValue) *10 +
            ([idnum substringWithRange:NSMakeRange(3,1)].intValue +
             [idnum substringWithRange:NSMakeRange(13,1)].intValue) *5 +
            ([idnum substringWithRange:NSMakeRange(4,1)].intValue +
             [idnum substringWithRange:NSMakeRange(14,1)].intValue) *8 +
            ([idnum substringWithRange:NSMakeRange(5,1)].intValue +
             [idnum substringWithRange:NSMakeRange(15,1)].intValue) *4 +
            ([idnum substringWithRange:NSMakeRange(6,1)].intValue +
             [idnum substringWithRange:NSMakeRange(16,1)].intValue) *2 +
            [idnum substringWithRange:NSMakeRange(7,1)].intValue *1 +
            [idnum substringWithRange:NSMakeRange(8,1)].intValue *6 +
            [idnum substringWithRange:NSMakeRange(9,1)].intValue *3;
            int Y = S %11;
            NSString *M =@"F";
            NSString *JYM =@"10X98765432";
            M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
            if ([M isEqualToString:[idnum substringWithRange:NSMakeRange(17,1)]]) {
                return YES;// 检测ID的校验位
            }else {
                return NO;
            }
        }else {
            return NO;
        }
    }else{
        return NO;
    }
}

- (BOOL)checkPassword{
    NSString *regex = @"^(?![^a-zA-Z]+$)(?!\\D+$).{6,16}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (CGFloat)px_getWidthWithFont:(UIFont *)font maxHeight:(CGFloat)maxHeight{
    return [self px_getSizeWihFont:font maxSize:CGSizeMake(MAXFLOAT, maxHeight)].width;
}

- (CGFloat)px_getHeightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth{
    return [self px_getSizeWihFont:font maxSize:CGSizeMake(maxWidth, MAXFLOAT)].height;
}

- (CGSize)px_getSizeWihFont:(UIFont *)font maxSize:(CGSize)maxSize{
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]){
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        CGRect rect = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return rect.size;
    }
    return CGSizeZero;
}



@end

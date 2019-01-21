//
//  UIFont+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UIFont+PX.h"

#define DEBUGLOG
#ifdef DEBUGLOG
#      define PXFontLog(fmt, ...) NSLog((@"Font" fmt), ##__VA_ARGS__);
#else
#      define PXFontLog(...)
#endif

@implementation UIFont (PX)

+ (void)px_showAllFonts{
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        PXFontLog(@"Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            PXFontLog(@"\tFont: %s \n", [fontName UTF8String] );
        }
    }
}

+ (UIFont *)px_microsoftYaHeiFontOfSize:(CGFloat)fontSize{
    return [UIFont fontWithName:@"MicrosoftYaHeiUI" size:fontSize];
}

@end

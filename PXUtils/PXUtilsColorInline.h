//
//  PXUtilsColorInline.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/22.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#ifndef PXUtilsColorInline_h
#define PXUtilsColorInline_h

#import "UIColor+PX.h"

/**
 16进制字符串生成颜色
 
 @param hexString 16进制字符串
 */
static inline UIColor *PXUtilsColorHex(NSString *hexString){
    return [UIColor px_colorWithHexString:hexString];
}

/**
 16进制字符串生成颜色，加透明度
 
 @param hexString 16进制字符串
 @param alpha 透明度
 */
static inline UIColor *PXUtilsColorHexAlpha(NSString *hexString, CGFloat alpha){
    return [UIColor px_colorWithHexString:hexString alpha:alpha];
}

/**
 生成随机色
 */
static inline UIColor *PXUtilsRandomColor(){
    return [UIColor px_randomColor];
}

/**
 000000
 */
static inline UIColor *PXUtilsColor000000(){
    return [UIColor px_colorWithHexString:@"000000"];
}

/**
 333333
 */
static inline UIColor *PXUtilsColor333333(){
    return [UIColor px_colorWithHexString:@"333333"];
}

/**
 666666
 */
static inline UIColor *PXUtilsColor666666(){
    return [UIColor px_colorWithHexString:@"666666"];
}

/**
 999999
 */
static inline UIColor *PXUtilsColor999999(){
    return [UIColor px_colorWithHexString:@"999999"];
}

/**
 333C40
 */
static inline UIColor *PXUtilsColor333C40(){
    return [UIColor px_colorWithHexString:@"333C40"];
}

/**
 FFFFFF
 */
static inline UIColor *PXUtilsColorFFFFFF(){
    return [UIColor px_colorWithHexString:@"FFFFFF"];
}

/**
 EFEFEF
 */
static inline UIColor *PXUtilsColorEFEFEF(){
    return [UIColor px_colorWithHexString:@"EFEFEF"];
}

/**
 DFDFDF
 */
static inline UIColor *PXUtilsColorDFDFDF(){
    return [UIColor px_colorWithHexString:@"DFDFDF"];
}

/**
 DADADA
 */
static inline UIColor *PXUtilsColorDADADA(){
    return [UIColor px_colorWithHexString:@"DADADA"];
}

/**
 F9F9F9
 */
static inline UIColor *PXUtilsColorF9F9F9(){
    return [UIColor px_colorWithHexString:@"F9F9F9"];
}

/**
 EAF1F5
 */
static inline UIColor *PXUtilsColorEAF1F5(){
    return [UIColor px_colorWithHexString:@"EAF1F5"];
}

/**
 A2ACB1
 */
static inline UIColor *PXUtilsColorA2ACB1(){
    return [UIColor px_colorWithHexString:@"A2ACB1"];
}

/**
 RED--FF304A
 */
static inline UIColor *PXUtilsColorFF304A(){
    return [UIColor px_colorWithHexString:@"FF304A"];
}

/**
 ORAGNE--FF9F00
 */
static inline UIColor *PXUtilsColorFF9F00(){
    return [UIColor px_colorWithHexString:@"FF9F00"];
}

/**
 D7DDE0
 */
static inline UIColor *PXUtilsColorD7DDE0(){
    return [UIColor px_colorWithHexString:@"D7DDE0"];
}

#endif /* PXUtilsColorInline_h */

//
//  UILabel+PX.h
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,PXLineType) {
    PXLineTypeMid = 1,///< 中划线
    PXLineTypeBottom = 2///< 下划线
};

typedef NS_ENUM(NSUInteger, PXTextAlignment) {
    PXTextAlignmentTop           = 5,///< 水平居中，垂直居上
    PXTextAlignmentBottom        = 6,///< 水平居中，垂直居下
    PXTextAlignmentLeftTop       = 7,///< 居左上对齐
    PXTextAlignmentRightTop      = 8,///< 居右上对齐
    PXTextAlignmentLeftBottom    = 9,///< 居左下对齐
    PXTextAlignmentRightBottom   = 10,///< 居右下对齐
};

@interface UILabel (PX)

@property (nonatomic,retain) UIColor *_Nullable lineColor;///< 划线颜色
@property (nonatomic,assign) PXLineType lineType;///< 划线样式

- (NSMutableAttributedString *)px_lineSpace:(CGFloat)space text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END

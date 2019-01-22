//
//  UILabel+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UILabel+PX.h"
#import <objc/runtime.h>

@implementation UILabel (PX)

+ (void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(setText:)), class_getInstanceMethod(self, @selector(pxSetText:)));
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(textRectForBounds:limitedToNumberOfLines:)), class_getInstanceMethod(self, @selector(px_textRectForBounds:limitedToNumberOfLines:)));
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(drawTextInRect:)), class_getInstanceMethod(self, @selector(px_drawTextInRect:)));
    });
}

- (void)setLineColor:(UIColor *)lineColor{
    objc_setAssociatedObject(self, @selector(lineColor), lineColor, OBJC_ASSOCIATION_RETAIN);
    [self px_lineType:self.lineType lineColor:lineColor];
}

- (UIColor *)lineColor{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLineType:(PXLineType)lineType{
    objc_setAssociatedObject(self, @selector(lineType), @(lineType), OBJC_ASSOCIATION_ASSIGN);
    [self px_lineType:lineType lineColor:self.lineColor];
}

- (PXLineType)lineType{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)pxSetText:(NSString *)text{
    [self pxSetText:text];
    [self px_lineType:self.lineType lineColor:self.lineColor];
}

- (CGRect)px_textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    
    CGRect textRect = [self px_textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch ((PXTextAlignment)self.textAlignment) {
        case PXTextAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            textRect.origin.x = 0.5 *(bounds.size.width - textRect.size.width);
            break;
        case PXTextAlignmentLeftTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case PXTextAlignmentRightTop:
            textRect.origin.y = bounds.origin.y;
            textRect.origin.x = bounds.size.width - textRect.size.width;
            break;
        case PXTextAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            textRect.origin.x = 0.5 *(bounds.size.width - textRect.size.width);
            break;
        case PXTextAlignmentLeftBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case PXTextAlignmentRightBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            textRect.origin.x = bounds.size.width - textRect.size.width;
            break;
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)px_drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [self px_drawTextInRect:actualRect];
}

- (void)px_lineType:(PXLineType)lineType lineColor:(UIColor *)lineColor{
    if (self.lineType > 0 && self.text) {
        NSMutableDictionary *params = [NSMutableDictionary new];
        if (lineType == PXLineTypeBottom) {
            [params setValue:[NSNumber numberWithInteger:NSUnderlineStyleSingle] forKey:NSUnderlineStyleAttributeName];
            if (lineColor) {
                [params setValue:lineColor forKey:NSUnderlineColorAttributeName];
            }
        }else{
            [params setValue:[NSNumber numberWithInteger:NSUnderlineStyleSingle] forKey:NSStrikethroughStyleAttributeName];
            if (lineColor) {
                [params setValue:lineColor forKey:NSStrikethroughColorAttributeName];
            }
        }
        self.attributedText = [[NSAttributedString alloc]initWithString:self.text attributes:params];
    }
}

- (NSMutableAttributedString *)px_lineSpace:(CGFloat)space text:(NSString *)text{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;
    NSMutableAttributedString *syString = [[NSMutableAttributedString alloc] initWithString:text];
    [syString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    return syString;
}

@end

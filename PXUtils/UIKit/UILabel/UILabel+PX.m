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
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(setText:)), class_getInstanceMethod(self, @selector(pxSetText:)));
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

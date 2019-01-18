//
//  UITextField+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UITextField+PX.h"
#import <objc/runtime.h>

@interface UITextField ()
@property (nonatomic,assign) NSUInteger maxLength;
@end

@implementation UITextField (PX)

+ (void)load{
    [super load];
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(setText:)), class_getInstanceMethod(self, @selector(pxSetText:)));
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(setPlaceholder:)), class_getInstanceMethod(self, @selector(pxSetPlaceholder:)));
}

- (void)setMaxLength:(NSUInteger)maxLength{
    objc_setAssociatedObject(self, @selector(maxLength), @(maxLength), OBJC_ASSOCIATION_ASSIGN);
}

- (NSUInteger)maxLength{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    objc_setAssociatedObject(self, @selector(placeholderColor), placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self pxPlaceholder];
}

- (void)pxSetPlaceholder:(NSString *)placeholder{
    [self pxSetPlaceholder:placeholder];
    [self pxPlaceholder];
}

- (void)pxPlaceholder{
    if (self.placeholderColor && self.placeholder) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:[NSDictionary dictionaryWithObject:self.placeholderColor forKey:NSForegroundColorAttributeName]];
    }
}

- (UIColor *)placeholderColor{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)pxSetText:(NSString *)text{
    [self pxSetText:text];
    if (self.maxLength) {
        [self textDidChanged:self];
    }

}

- (void)px_limitMaxLength:(NSUInteger)maxLength{
    NSAssert(maxLength>=0, @"请设置正确的最大长度");//最大长度必须大于等于0
    self.maxLength = maxLength;
    if (self.text.length > 0) {
        [self textDidChanged:self];
    }
    [self addTarget:self action:@selector(textDidChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textDidChanged:(UITextField *)textField{
    NSUInteger maxLength = self.maxLength;
    NSString *text = textField.text;
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    if (!position || !selectedRange){
        if (text.length > maxLength){
            NSRange rangeIndex = [text rangeOfComposedCharacterSequenceAtIndex:maxLength];
            if (rangeIndex.length == 1){
                textField.text = [text substringToIndex:maxLength];
            }else{
                NSRange rangeRange = [text rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                textField.text = [text substringWithRange:rangeRange];
            }
        }
    }
}

@end

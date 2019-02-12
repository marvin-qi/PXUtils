//
//  UITextField+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UITextField+PX.h"
#import <objc/runtime.h>

@implementation UITextField (PX)

+ (void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(setText:)), class_getInstanceMethod(self, @selector(pxSetText:)));
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(setPlaceholder:)), class_getInstanceMethod(self, @selector(pxSetPlaceholder:)));
    });
}

- (void)setIsMobileTextField:(BOOL)isMobileTextField{
    objc_setAssociatedObject(self, @selector(isMobileTextField), @(isMobileTextField), OBJC_ASSOCIATION_ASSIGN);
    if (isMobileTextField) {
        self.keyboardType = UIKeyboardTypePhonePad;
        self.maxLength = 11;
    }else{
        self.keyboardType = UIReturnKeyDefault;
        self.maxLength = 0;
    }
}

- (BOOL)isMobileTextField{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (BOOL)isMobile{
    NSString *phoneRegex = @"^1([3-9][0-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self.text];
}

- (void)setMaxLength:(NSUInteger)maxLength{
    if (maxLength <= 0 ) return;
    objc_setAssociatedObject(self, @selector(maxLength), @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    if (self.text.length > 0) {
        [self textDidChanged:self];
    }
    [self addTarget:self action:@selector(textDidChanged:) forControlEvents:UIControlEventEditingChanged];
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
    if (maxLength <= 0 ) return;
    self.maxLength = maxLength;
}

- (void)textDidChanged:(UITextField *)textField{
    if (self.maxLength <= 0) return;
    NSString *text = textField.text;
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    if (!position || !selectedRange){
        if (text.length > self.maxLength){
            NSRange rangeIndex = [text rangeOfComposedCharacterSequenceAtIndex:self.maxLength];
            if (rangeIndex.length == 1){
                textField.text = [text substringToIndex:self.maxLength];
            }else{
                NSRange rangeRange = [text rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.maxLength)];
                textField.text = [text substringWithRange:rangeRange];
            }
        }
    }
}

@end

//
//  UITextView+PX.m
//  PXUtilsDemo
//
//  Created by Charles on 2019/1/17.
//  Copyright © 2019 Charles.Qi. All rights reserved.
//

#import "UITextView+PX.h"
#import <objc/runtime.h>

@interface UITextView ()
@property (nonatomic,strong) UILabel *placeholderLabel;///< placeholder显示的文本
@end

@implementation UITextView (PX)

+ (void)load{
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(setText:)), class_getInstanceMethod(self, @selector(pxSetText:)));
        method_exchangeImplementations(class_getInstanceMethod(self, @selector(setFrame:)), class_getInstanceMethod(self, @selector(pxSetFrame:)));
    });
}

- (void)setMaxLength:(NSUInteger)maxLength{
    NSAssert(maxLength>0, @"必须设置大于0的长度");
    objc_setAssociatedObject(self, @selector(maxLength), @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    if (self.text.length > 0) {
        [self textDidChanged:self];
    }
    self.placeholderLabel.backgroundColor = [UIColor clearColor];
}

- (NSUInteger)maxLength{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setPlaceholder:(NSString *)placeholder{
    objc_setAssociatedObject(self, @selector(placeholder), placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.placeholderLabel.text = placeholder;
    [self textDidChanged:self];
}

- (NSString *)placeholder{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    objc_setAssociatedObject(self, @selector(placeholderColor), placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.placeholderLabel.textColor = placeholderColor;
    [self textDidChanged:self];
}

- (UIColor *)placeholderColor{
    return objc_getAssociatedObject(self, _cmd)?:[UIColor blackColor];
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont{
    objc_setAssociatedObject(self, @selector(placeholderFont), placeholderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.placeholderLabel.font = placeholderFont;
    [self textDidChanged:self];
}

- (UIFont *)placeholderFont{
    return objc_getAssociatedObject(self, _cmd)?:[UIFont systemFontOfSize:16];
}

- (void)pxSetText:(NSString *)text{
    [self pxSetText:text];
    [self textDidChanged:self];
}

- (void)pxSetFrame:(CGRect)frame{
    [self pxSetFrame:frame];
    [self textDidChanged:self];
}

- (void)px_limitMaxLength:(NSUInteger)maxLength{
    self.maxLength = maxLength;
}

- (void)textDidChanged{
    [self textDidChanged:self];
}

- (void)textDidChanged:(UITextView *)textView{
    NSUInteger maxLength = self.maxLength;
    if (maxLength > 0) {
        NSString *text = textView.text;
        UITextRange *selectedRange = [textView markedTextRange];
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        if (!position || !selectedRange){
            if (text.length > maxLength){
                NSRange rangeIndex = [text rangeOfComposedCharacterSequenceAtIndex:maxLength];
                if (rangeIndex.length == 1){
                    textView.text = [text substringToIndex:maxLength];
                }else{
                    NSRange rangeRange = [text rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                    textView.text = [text substringWithRange:rangeRange];
                }
            }
        }
    }
    if (textView.text.length > 0) {//隐藏
        self.placeholderLabel.hidden = TRUE;
    }else{//显示
        CGFloat left = self.textContainer.lineFragmentPadding + self.textContainerInset.left + self.layer.borderWidth;
        CGFloat top = self.textContainerInset.top + self.layer.borderWidth;
        CGFloat width = CGRectGetWidth(self.bounds) - 2 * left;
        CGFloat height = [self.placeholderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        height = MIN(height, (CGRectGetHeight(self.bounds) - 2 * top));
        self.placeholderLabel.frame = CGRectMake(left, top, width, height);
        self.placeholderLabel.hidden = FALSE;
    }
}

- (UILabel *)placeholderLabel{
    UILabel *view = objc_getAssociatedObject(self, _cmd);
    if (!view) {
        view = [[UILabel alloc] init];
        [self addSubview:view];
        view.textColor = objc_getAssociatedObject(self, @selector(textColor));
        view.font = objc_getAssociatedObject(self, @selector(font));
        objc_setAssociatedObject(self, _cmd, view, OBJC_ASSOCIATION_RETAIN);
        view.numberOfLines = 0;
        view.backgroundColor = [UIColor clearColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged) name:UITextViewTextDidChangeNotification object:nil];
    }
    return view;
}

@end

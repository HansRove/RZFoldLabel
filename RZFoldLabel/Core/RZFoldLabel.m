//
//  RZFoldLabel.m
//  RZColorfulExample
//
//  Created by xk_mac_mini on 2019/11/19.
//  Copyright © 2019 rztime. All rights reserved.
//

#import "RZFoldLabel.h"
#import "UITextView+RZColorful.h"
#import "NSString+RZCode.h"
#import <Masonry/Masonry.h>

@interface RZFoldLabel ()

@property (nonatomic, strong) UITextView *textView;
/** <#bref#> */
@property (nonatomic, copy) NSArray *edgeLayouts;

/** 折叠之后，要展示的内容 */
@property (nonatomic, copy) NSAttributedString *displayFoldAttr;
/** 全部展开之后，要展示的内容 */
@property (nonatomic, copy) NSAttributedString *displayNormalFoldAttr;

@end

@implementation RZFoldLabel

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.condtion = RZAttributedStringAppendConditionMore;
        _fold = YES;
        _textView = [[UITextView alloc] init];
        [self addSubview:_textView];
        _textView.backgroundColor = UIColor.clearColor;
        _textView.contentInset = UIEdgeInsetsZero;
        _textView.textContainerInset = UIEdgeInsetsZero;
        _textView.scrollEnabled = NO;
        _textView.editable = NO;
        _textView.textContainer.lineFragmentPadding = 0;
        _textView.showsVerticalScrollIndicator = NO;
        _textView.showsHorizontalScrollIndicator = NO;
        _textView.linkTextAttributes = @{};
        _textView.translatesAutoresizingMaskIntoConstraints = NO;
        __weak typeof (self) weakSelf = self;
        _textView.rzDidTapTextView = ^BOOL(id  _Nullable tapObj) {
            NSString *action = tapObj;
            if ([action isKindOfClass:[NSURL class]]) {
                action = [(NSURL *)action absoluteString];
            }
            if ([action isKindOfClass:[NSString class]]) {
                if (weakSelf.rzDidTapLabel) {
                    weakSelf.rzDidTapLabel(action.rz_decodedString, weakSelf);
                }
            }
            return NO;
        };
        self.textInsetEdge = UIEdgeInsetsZero;
    }
    return self;
}

- (CGRect)textDrawRect {
    return CGRectMake(0, 0, self.textView.bounds.size.width, CGFLOAT_MAX);
}

- (void)resetAttributedText {
    if (self.fold) {
        self.textView.attributedText = self.displayFoldAttr;
    } else {
        self.textView.attributedText = self.displayNormalFoldAttr;
    }
}
- (void)setFold:(BOOL)fold {
    _fold = fold;
    [self resetAttributedText];
}

- (void)setTextInsetEdge:(UIEdgeInsets)textInsetEdge {
    _textInsetEdge = textInsetEdge;
    
//    if (self.edgeLayouts) {
//        [self removeConstraints:self.edgeLayouts];
//    }
//    // 上
//    NSLayoutConstraint *top = [NSLayoutConstraint
//                               constraintWithItem:self.textView
//                               attribute:NSLayoutAttributeTop
//                               relatedBy:NSLayoutRelationEqual
//                               toItem:self
//                               attribute:NSLayoutAttributeTop
//                               multiplier:1.0
//                               constant:textInsetEdge.top];
//    // 左
//    NSLayoutConstraint *left = [NSLayoutConstraint
//                                constraintWithItem:self.textView
//                                attribute:NSLayoutAttributeLeft
//                                relatedBy:NSLayoutRelationEqual
//                                toItem:self
//                                attribute:NSLayoutAttributeLeft
//                                multiplier:1.0
//                                constant:textInsetEdge.left];
//    // 右
//    NSLayoutConstraint *right = [NSLayoutConstraint
//                                 constraintWithItem:self.textView
//                                 attribute:NSLayoutAttributeRight
//                                 relatedBy:NSLayoutRelationEqual
//                                 toItem:self
//                                 attribute:NSLayoutAttributeRight
//                                 multiplier:1.0
//                                 constant:-textInsetEdge.right];
//    // 下
//    NSLayoutConstraint *bottom = [NSLayoutConstraint
//                                  constraintWithItem:self.textView
//                                  attribute:NSLayoutAttributeBottom
//                                  relatedBy:NSLayoutRelationEqual
//                                  toItem:self
//                                  attribute:NSLayoutAttributeBottom
//                                  multiplier:1.0
//                                  constant:-textInsetEdge.bottom];
//    self.edgeLayouts = @[top, left, bottom, right];
//    [self addConstraints: self.edgeLayouts];
    [self.textView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(textInsetEdge);
    }];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    _attributedText = attributedText;
    self.textView.attributedText = attributedText;
    self.displayFoldAttr = nil;
    self.displayNormalFoldAttr = nil;
    [self.textView layoutIfNeeded];
    [self resetAttributedText];
}

- (NSAttributedString *)displayFoldAttr {
    if (!_displayFoldAttr) {
        _displayFoldAttr = [self.attributedText rz_appendAttributedString:self.showAllText when:self.condtion line:self.numberOfLines inRect:self.textDrawRect];
    }
    return _displayFoldAttr;
}

- (NSAttributedString *)displayNormalFoldAttr {
    if (!_displayNormalFoldAttr) {
        NSMutableAttributedString *temp = self.attributedText.mutableCopy;
        if (self.foldText) {
            [temp appendAttributedString:self.foldText];
        }
        _displayNormalFoldAttr = temp.copy;
    }
    return _displayNormalFoldAttr;
}

@end


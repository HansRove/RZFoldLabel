//
//  RZFoldLabel.h
//  RZColorfulExample
//
//  Created by xk_mac_mini on 2019/11/19.
//  Copyright © 2019 rztime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NSAttributedString+RZColorful.h>

NS_ASSUME_NONNULL_BEGIN

/// 可以在文本超出一定行数之后，显示（展开、收起）文本点击事件的Label
/// 实际上是在UIView上新增一个UITextView，然后在UITextView上的操作
/// 这样也可以实现Label的文本Link点击事件
@interface RZFoldLabel : UIView

/** Label正常展示的文本 请在本文所有属性配置完成之后，再赋值*/
@property (nonatomic, copy) NSAttributedString *attributedText;
/** 超过多少行时才需要折叠 */
@property (nonatomic, assign) NSInteger numberOfLines;
/** 条件
    默认为 RZAttributedStringAppendConditionMore
            
    fold = YES时，如果显示行数超过numberOfLines，追加foldAttributedString之后长度若超出，将截取attributedText的文字
 
    Less: 比numberOfLines小时，将会把foldAttributedString加入到attributedText之后
    Equal: 与numberOfLines相等时，将会把foldAttributedString加入到attributedText之后
    More: 比numberOfLines大时，将会把foldAttributedString加入到attributedText之后
 */
@property (nonatomic, assign) RZAttributedStringAppendCondition condtion;
/** 文字边距 与Label的边距
 默认 UIEdgeInsetsZero */
@property (nonatomic, assign) UIEdgeInsets textInsetEdge;

/** 折叠，切换  默认YES
    YES: 折叠
    NO：展开（显示全部）
 */
@property (nonatomic, assign, getter = isFold) BOOL fold;

/** 折叠状态时，尾部追加的显示的内容 （点击将会展开）如"显示全文"
    富文本，可以显示图文混排，
    备注：请给文字和图片都要增加   [.tapAction(actionName)]   图片和文字的actionName请勿一致，否则会有系统级bug导致崩溃
    要切换 展开、收起 在 [ rzDidTapLabel]中，设置fold = !fold;
 */
@property (nonatomic, copy) NSAttributedString *showAllText;
/** 全部显示时，尾部追加的内容 （点击将会收起） 如“收起”
    富文本，可以显示图文混排，
    备注：请给文字和图片都要增加   [.tapAction(actionName)]   图片和文字的actionName请勿一致，否则会有系统级bug导致崩溃
    要切换 展开、收起 在 [ rzDidTapLabel]中，设置fold = !fold;
 */
@property (nonatomic, copy) NSAttributedString *foldText;

/** 点击label里的可以点击的字符串时，将会响应
    (给attributedString  或 foldAttributedString 或 normalAttributedString 字符串或图片设置了tapAction()或html中包含 [<a herf='xxx'> </a> ]将会回调此方法)
 */
@property (nonatomic, copy) void(^rzDidTapLabel)(NSString * __nullable tapObj, RZFoldLabel *label);

@end

NS_ASSUME_NONNULL_END

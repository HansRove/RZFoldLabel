//
//  RZFoldLabelDemoController.m
//  RZColorfulExample
//
//  Created by xk_mac_mini on 2019/11/19.
//  Copyright © 2019 rztime. All rights reserved.
//

#import "RZFoldLabelDemoController.h"
#import "RZFoldLabel.h"
#import "NSAttributedString+RZColorful.h"
#import <Masonry/Masonry.h>
#import "UITextView+RZColorful.h"

@interface RZFoldLabelDemoController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RZFoldLabelDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    //    RZFoldLabel *label = [[RZFoldLabel alloc] init];
    //            [self.view addSubview:label];
    //            [label mas_makeConstraints:^(MASConstraintMaker *make) {
    //                make.center.equalTo(self.view);
    //                make.top.equalTo(self.view).offset(10);
    //                make.bottom.equalTo(self.view).offset(-10);;
    //                make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - 20));  // cell 在初始化的时候，width = 320，所以设置左右的时候，首次计算label的宽度是固定在320，这样计算出的显示的宽度在大屏手机上会有偏差
    //            }];
    //            label.tag = 10;
    //            // 先进行各项属性配置  最后设置 attributedText
    //            label.textInsetEdge = UIEdgeInsetsMake(5, 5, 5, 5); // 设置文本上下左右间距
    //            label.condtion = RZAttributedStringAppendConditionMore;
    //            label.numberOfLines = 5;   // 超过5行时，折叠
    //    //        label.fold = YES; // 默认折叠
    //
    //
    //
    //            // 要给图片或文字添加tapAction，才能实现rzDidTapLabel在回调中知道要做的点击事件处理
    //            // 图片 文字的tapAction，在相邻情况下，请勿使用同一个，否则长按会遇到系统的bug导致crash
    //
    //            // 折叠时，追加在最后的文本
    //            label.foldAttributedString = [NSAttributedString rz_colorfulConfer:^(RZColorfulConferrer *confer) {
    //                confer.text(@"\n");  // 另起一行,不设置时，将直接在第五行文本最后
    //                   confer.appendImage([UIImage imageNamed:@"test.jpg"]).size(CGSizeMake(20, 15), RZHorizontalAlignCenter, [UIFont systemFontOfSize:16]).tapAction(@"rz_fold_image");// 实现点击
    //                   confer.text(@"全文").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor).tapAction(@"rz_fold"); // 实现点击
    //               }];
    //            // 展开全部时，追加在最后的文本
    //               label.normalAttributedString =  [NSAttributedString rz_colorfulConfer:^(RZColorfulConferrer *confer) {
    //                   confer.paragraphStyle.alignment(NSTextAlignmentRight); // 可以设置文本显示在左、中、右 （在foldType = RZFoldLabelFoldTypeNextRow 时才生效，在Normal时，跟随之前文本的配置来对齐）
    //                   confer.appendImage([UIImage imageNamed:@"test.jpg"]).size(CGSizeMake(20, 15), RZHorizontalAlignCenter, [UIFont systemFontOfSize:16]).tapAction(@"rz_fold_image"); // 实现点击
    //                   confer.text(@"收起").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor).tapAction(@"rz_fold"); // 实现点击
    //               }];
    //            // 点击可点击文字之后的回调
    //                __weak typeof (self) weakSelf = self;
    //               label.rzDidTapLabel = ^(NSString * _Nullable tapObj, RZFoldLabel *label) {
    //                   NSLog(@"%@", tapObj);
    //                   if ([tapObj isEqualToString:@"rz_fold_image"] || [tapObj isEqualToString:@"rz_fold"]) {
    //                       label.fold = !label.fold;
    //                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //                           [weakSelf.tableView reloadData];
    //                       });
    //                   }
    //               };
    //           label.attributedText = [NSAttributedString rz_colorfulConfer:^(RZColorfulConferrer *confer) {
    //                   confer.text(@"1.RZFoldLabel就是一个UIView套一个UITextView，将UITextView显示富文本并可点击其NSLink属性的代理，用于完成折叠、展开的功能\n").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
    //                   confer.text(@"2.在初始化attributedText时，可对文本各种属性进行富文本配置，可设置tapAction等做点击事件处理\n").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
    //               confer.text(@"3.在初始化foldAttributedString、normalAttributedString时，即对").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
    //                   confer.text(@"收起").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
    //                   confer.text(@"或").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
    //                   confer.text(@"展开").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
    //                   confer.text(@"（点击事件）进行设置，都可进行图文混排\n\n").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
    //                   confer.text(@"4.备注:\n").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
    //                   confer.text(@"      在foldAttributedString或normalAttributedString中，需要对文字和图片都设置tapAction, ").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
    //                   confer.text(@"（注意，tapAction图片和文字不要设置成同一个，否则长按时会crash）").font([UIFont systemFontOfSize:16]).textColor(UIColor.blueColor);
    //                   confer.text(@"要展开、收起，在rzDidTapLabel中，根据点击事件tapAction,设置label.fold = !label.fold").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
    //
    //               }];
    //
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.self.tableView.estimatedRowHeight = 100;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        RZFoldLabel *label = [[RZFoldLabel alloc] init];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cell.contentView);
            make.top.equalTo(cell.contentView).offset(10);
            make.bottom.equalTo(cell.contentView).offset(-10);;
            make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - 20));  // cell 在初始化的时候，width = 320，所以设置左右的时候，首次计算label的宽度是固定在320，这样计算出的显示的宽度在大屏手机上会有偏差
        }];
        label.tag = 10;
        // 先进行各项属性配置  最后设置 attributedText
        label.textInsetEdge = UIEdgeInsetsMake(5, 5, 5, 5); // 设置文本上下左右间距
        label.condtion = RZAttributedStringAppendConditionMore;
        label.numberOfLines = 5;   // 超过5行时，折叠
        //        label.fold = YES; // 默认折叠
        
        
        
        // 要给图片或文字添加tapAction，才能实现rzDidTapLabel在回调中知道要做的点击事件处理
        // 图片 文字的tapAction，在相邻情况下，请勿使用同一个，否则长按会遇到系统的bug导致crash
        
        // 折叠时，追加在最后的文本
        label.foldAttributedString = [NSAttributedString rz_colorfulConfer:^(RZColorfulConferrer *confer) {
            confer.text(@"...").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor); // 实现点击
            confer.appendImage([UIImage imageNamed:@"showmore"]).size(CGSizeMake(15, 15), RZHorizontalAlignCenter, [UIFont systemFontOfSize:16]).tapAction(@"rz_fold_image");// 实现点击
            confer.text(@"全文").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor).tapAction(@"rz_fold"); // 实现点击
        }];
        // 展开全部时，追加在最后的文本
        label.normalAttributedString =  [NSAttributedString rz_colorfulConfer:^(RZColorfulConferrer *confer) {
            confer.paragraphStyle.alignment(NSTextAlignmentRight); // 可以设置文本显示在左、中、右 （在foldType = RZFoldLabelFoldTypeNextRow 时才生效，在Normal时，跟随之前文本的配置来对齐）
            confer.appendImage([UIImage imageNamed:@"fold"]).size(CGSizeMake(15, 15), RZHorizontalAlignCenter, [UIFont systemFontOfSize:16]).tapAction(@"rz_fold_image"); // 实现点击
            confer.text(@"收起").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor).tapAction(@"rz_fold"); // 实现点击
        }];
        // 点击可点击文字之后的回调
        __weak typeof (self) weakSelf = self;
        label.rzDidTapLabel = ^(NSString * _Nullable tapObj, RZFoldLabel *label) {
            NSLog(@"%@", tapObj);
            if ([tapObj isEqualToString:@"rz_fold_image"] || [tapObj isEqualToString:@"rz_fold"]) {
                label.fold = !label.fold;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [weakSelf.tableView reloadData];
                });
            }
        };
        
    }
    RZFoldLabel *label = [cell.contentView viewWithTag:10];
    label.attributedText = [NSAttributedString rz_colorfulConfer:^(RZColorfulConferrer *confer) {
        confer.text(@"1.RZFoldLabel就是一个UIView套一个UITextView，将UITextView显示富文本并可点击其NSLink属性的代理，用于完成折叠、展开的功能\n").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
        confer.text(@"2.在初始化attributedText时，可对文本各种属性进行富文本配置，可设置tapAction等做点击事件处理\n").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
        confer.text(@"3.在初始化foldAttributedString、normalAttributedString时，即对").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
        confer.text(@"收起").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
        confer.text(@"或").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
        confer.text(@"展开").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
        confer.text(@"（点击事件）进行设置，都可进行图文混排\n\n").font([UIFont systemFontOfSize:16]).textColor(UIColor.blackColor);
        confer.text(@"4.备注:\n").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
        confer.text(@"      在foldAttributedString或normalAttributedString中，需要对文字和图片都设置tapAction, ").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
        confer.text(@"（注意，tapAction图片和文字不要设置成同一个，否则长按时会crash）").font([UIFont systemFontOfSize:16]).textColor(UIColor.blueColor);
        confer.text(@"要展开、收起，在rzDidTapLabel中，根据点击事件tapAction,设置label.fold = !label.fold").font([UIFont systemFontOfSize:16]).textColor(UIColor.redColor);
        
    }];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end



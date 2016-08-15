//
//  XQRecordView.h
//  XQRecordView
//
//  Created by Xia_Q on 16/8/4.
//  Copyright © 2016年 X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"
#import "ImageBtn.h"
@interface XQRecordView : UIView


//第几次签到,小于一次传one,大于等于三次传three
typedef NS_ENUM(NSInteger, RecordNumber) {
    one = 0, 
    two = 1,
    three = 2,
};

//通过此方法会根据设置的控件宽度自行计算控件的高度，所以idinit方法的设置frame的值的高度可随便写，当要改变view的高度时也是调用此方法
-(void)setHightWithRecordNumber:(RecordNumber)number;

//设置渐变颜色值的区间，只需在初始化后实现一次即可
-(void)showColorWithStartHexString:(NSString *)starColor endHexString:(NSString *)endColor;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;

//签到按扭
@property (nonatomic,strong)ImageBtn *recordBtn;
@property (nonatomic,strong)UILabel *upRecordLable;
@property (nonatomic,strong)UILabel *midRecordLable;
@property (nonatomic,strong)UILabel *downRecordLable;

//右侧显示的状态lable
@property (nonatomic,strong)UILabel *upStateLable;
@property (nonatomic,strong)UILabel *midStateLable;
@property (nonatomic,strong)UILabel *downStateLable;

@end

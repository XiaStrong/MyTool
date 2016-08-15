//
//  XQTimePicker.h
//  Demo
//
//  Created by Xia_Q on 15/8/21.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XQTimePicker;

@protocol XQTimePickerDelegate <NSObject>

-(void)toolbarBtnClick:(XQTimePicker*)pickView BackString:(NSString *)resultString;

@end

@interface XQTimePicker : UIView


@property(nonatomic,weak) id<XQTimePickerDelegate> delegate;


-(instancetype)initDatePickWithDate:(NSDate *)defaulDate datePickerMode:(UIDatePickerMode)datePickerMode withMinDate:(NSDate *)min MaxData:(NSDate *)max;


-(void)remove;


-(void)show;

@end

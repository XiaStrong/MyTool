//
//  XQTimePicker.m
//  Demo
//
//  Created by Xia_Q on 15/8/21.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#define ZHToobarHeight 40
#import "XQTimePicker.h"


@interface XQTimePicker ()


@property(nonatomic,strong)UIView *toolView;
@property(nonatomic,strong)UIToolbar *toolbar;

@property(nonatomic,strong)UIDatePicker *datePicker;

@property(nonatomic,assign)NSDate *defaulDate;
@property(nonatomic,assign)NSInteger pickeviewHeight;


@property(nonatomic,copy)NSString *resultString;



@end

@implementation XQTimePicker


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

-(instancetype)initDatePickWithDate:(NSDate *)defaulDate datePickerMode:(UIDatePickerMode)datePickerMode  withMinDate:(NSDate *)min MaxData:(NSDate *)max
{
    self=[super init];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        _defaulDate=defaulDate;
        
        self.frame=[UIScreen mainScreen].bounds;

        UIView *backView=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        backView.backgroundColor=[UIColor blackColor];
        backView.alpha=0.8;
        [self addSubview:backView];
        
        UITapGestureRecognizer *tgr=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tgr:)];
        [backView addGestureRecognizer:tgr];

        CGRect rect=[UIScreen mainScreen].bounds;

        
        UIDatePicker *datePicker=[[UIDatePicker alloc] init];
        datePicker.frame=CGRectMake(0,XH-datePicker.frame.size.height-40, rect.size.width, datePicker.frame.size.height);
        datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        datePicker.datePickerMode = datePickerMode;
        datePicker.backgroundColor=[UIColor whiteColor];
        if (_defaulDate) {
            [datePicker setDate:_defaulDate];
        }
        _datePicker=datePicker;
        if (min!=nil) {
            _datePicker.minimumDate=min;
        }
        if (max!=nil) {
            _datePicker.maximumDate=max;
        }
        
    
        datePicker.frame=CGRectMake(0, XH-datePicker.frame.size.height-40, rect.size.width, datePicker.frame.size.height);
        _pickeviewHeight=datePicker.frame.size.height;
        [self addSubview:datePicker];

        
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0,XH-40, XW, 40)];
        view.backgroundColor=[UIColor whiteColor];
        
        UIButton *leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame=CGRectMake(20, 5, 100, 30);
        [leftBtn.layer setCornerRadius:5];
        leftBtn.backgroundColor=RGB(250,74 ,104 );
        [leftBtn setTitle:@"确定" forState:UIControlStateNormal];
        [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:leftBtn];
        
        
        UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame=CGRectMake(XW-120 , 5, 100, 30);
        [rightBtn.layer setCornerRadius:5];
        rightBtn.backgroundColor=RGB(250,74 ,104);
        [rightBtn setTitle:@"取消" forState:UIControlStateNormal];
        [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:rightBtn];

        [self addSubview:view];
    }
    return self;

}


-(void)tgr:(UITapGestureRecognizer *)tgr
{
    [self removeFromSuperview];
}

-(void)setUpDatePickerWithdatePickerMode:(UIDatePickerMode)datePickerMode{

}

-(void)remove{
    
    [self removeFromSuperview];
}

-(void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
}

-(void)doneClick
{
    
    if (_datePicker) {
        NSLog(@"---------%@",_datePicker.date);
//        NSString *date=[NSString stringWithFormat:@"%@",_datePicker.date];
        
        NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
        dateFor.dateFormat = @"yyyy-MM-dd";
        
        NSString *babyTime  = [dateFor stringFromDate:_datePicker.date];
        //        NSString *str=[date substringToIndex:10];
        
        _resultString=[NSString stringWithFormat:@"%@",babyTime];
        
    }
    
    if ([self.delegate respondsToSelector:@selector(toolbarBtnClick:BackString:)]) {
        [self.delegate toolbarBtnClick:self BackString:_resultString];
    }
    [self removeFromSuperview];
}

@end

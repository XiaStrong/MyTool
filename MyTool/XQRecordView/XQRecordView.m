//
//  XQRecordView.m
//  XQRecordView
//
//  Created by Xia_Q on 16/8/4.
//  Copyright © 2016年 X. All rights reserved.
//

#import "XQRecordView.h"
#import "UIColor+XQColor.h"

#define IS_IPhone5 ([[UIScreen mainScreen] bounds].size.height <= 568 ? YES : NO)
#define IS_IPhone6 ([[UIScreen mainScreen] bounds].size.height==667 ? YES : NO)
#define IS_IPhone6plus ([[UIScreen mainScreen] bounds].size.height==736 ? YES : NO)
#define IS_Ipad ([[UIScreen mainScreen] bounds].size.height >736 ? YES : NO)

@implementation XQRecordView


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.layer setCornerRadius:10];
        self.clipsToBounds=YES;
        _gradientLayer=[CAGradientLayer layer];
        [self.layer addSublayer:_gradientLayer];
        
        [self creatUI];
    }
    return self;
    
}

-(void)showColorWithStartHexString:(NSString *)starColor endHexString:(NSString *)endColor{
    
    //设置简便颜色
    _gradientLayer.startPoint=CGPointMake(0, 0);
    _gradientLayer.endPoint=CGPointMake(0, 1);
    _gradientLayer.colors = @[(__bridge id)[UIColor colorFromHexString:starColor].CGColor,
                              (__bridge id)[UIColor colorFromHexString:endColor].CGColor];
    _gradientLayer.locations = @[@(0.0f) ,@(1.0f)];

}


-(void)creatUI
{

    CGFloat viewW=self.frame.size.width;
    CGFloat swv = viewW * 11/150.0; //内部空键离左边的距离
    CGFloat vw=viewW*64/75.0;//内部控件的宽度
    CGFloat bvh=viewW*26/75.0;//btn的高度
    CGFloat ssv=viewW*15/150.0;//内部控件离父视图的高度
    CGFloat vvh=viewW*15/75.0;//内部Lable的高度
    CGFloat jj =viewW*5/150;//连个控件之间的距离
    
    
    _recordBtn=[[ImageBtn alloc]initWithFrame:CGRectMake(swv, ssv, vw, bvh)];
    _recordBtn.img.image=[UIImage imageNamed:@"签到icon"];
    [self addSubview:_recordBtn];
    
    
    _upRecordLable=[[UILabel alloc]initWithFrame:CGRectMake(swv, ssv+bvh+jj, vw*0.6, vvh)];
    _upRecordLable.backgroundColor=[UIColor clearColor];
    _upRecordLable.textColor=[UIColor whiteColor];
    [self addSubview:_upRecordLable];
    
    _upStateLable=[[UILabel alloc]initWithFrame:CGRectMake(swv+vw*0.6, ssv+bvh+jj, vw*0.4, vvh)];
    _upStateLable.textAlignment=NSTextAlignmentRight;
    _upStateLable.textColor=[UIColor whiteColor];
    _upStateLable.backgroundColor=[UIColor clearColor];
    [self addSubview:_upStateLable];

    
    _midRecordLable=[[UILabel alloc]initWithFrame:CGRectMake(swv, ssv+bvh+jj+vvh+jj, vw*0.6, vvh)];
    _midRecordLable.backgroundColor=[UIColor clearColor];
    _midRecordLable.textColor=[UIColor whiteColor];
    [self addSubview:_midRecordLable];
    
    _midStateLable=[[UILabel alloc]initWithFrame:CGRectMake(swv+vw*0.6, ssv+bvh+jj+vvh+jj, vw*0.4, vvh)];
    _midStateLable.textAlignment=NSTextAlignmentRight;
    _midStateLable.textColor=[UIColor whiteColor];
    _midStateLable.backgroundColor=[UIColor clearColor];
    [self addSubview:_midStateLable];

    
    _downRecordLable=[[UILabel alloc]initWithFrame:CGRectMake(swv, ssv+bvh+jj+vvh+jj+vvh+jj, vw*0.6, vvh)];
    _downRecordLable.backgroundColor=[UIColor clearColor];
    _downRecordLable.textColor=[UIColor whiteColor];
    [self addSubview:_downRecordLable];
    
    
    _downStateLable=[[UILabel alloc]initWithFrame:CGRectMake(swv+vw*0.6, ssv+bvh+jj+vvh+jj+vvh+jj, vw*0.4, vvh)];
    _downStateLable.textAlignment=NSTextAlignmentRight;
    _downStateLable.textColor=[UIColor whiteColor];
    _downStateLable.backgroundColor=[UIColor clearColor];
    [self addSubview:_downStateLable];
    
    
    //iphone6以下屏幕字体
    if (IS_IPhone5||IS_IPhone6) {
        _upRecordLable.font=[UIFont systemFontOfSize:15];
        _midRecordLable.font=[UIFont systemFontOfSize:15];
        _downRecordLable.font=[UIFont systemFontOfSize:15];
        _upStateLable.font=[UIFont systemFontOfSize:15];
        _midStateLable.font=[UIFont systemFontOfSize:15];
        _downStateLable.font=[UIFont systemFontOfSize:15];
    }
    
    if (IS_IPhone6plus) {
        _upRecordLable.font=[UIFont systemFontOfSize:17];
        _midRecordLable.font=[UIFont systemFontOfSize:17];
        _downRecordLable.font=[UIFont systemFontOfSize:17];
        _upStateLable.font=[UIFont systemFontOfSize:17];
        _midStateLable.font=[UIFont systemFontOfSize:17];
        _downStateLable.font=[UIFont systemFontOfSize:17];
    }
    
    if (IS_Ipad) {
        
        _upRecordLable.font=[UIFont systemFontOfSize:30];
        _midRecordLable.font=[UIFont systemFontOfSize:30];
        _downRecordLable.font=[UIFont systemFontOfSize:30];
        _upStateLable.font=[UIFont systemFontOfSize:30];
        _midStateLable.font=[UIFont systemFontOfSize:30];
        _downStateLable.font=[UIFont systemFontOfSize:30];
    }
    

}


-(void)setHightWithRecordNumber:(RecordNumber)number{
    
    CGFloat viewW=self.frame.size.width;
    CGFloat bvh=viewW*26/75.0;//btn的高度
    CGFloat ssv=viewW*15/150.0;//内部控件离父视图的高度
    CGFloat vvh=viewW*15/75.0;//内部Lable的高度
    CGFloat jj =viewW*5/150;//两个View借我相隔的间距


    //若是不想要动画可以改为0.0，或者直接提取animations里面的代码
    [UIView animateWithDuration:0.2 animations:^{
        if (number==one) {
            self.height=ssv+bvh+vvh+jj+5;
        }
        
        if (number==two) {
            self.height=ssv+bvh+vvh+jj+vvh+jj+5;
        }
        
        if (number==three) {
            self.height=ssv+bvh+vvh+jj+vvh+jj+vvh+ssv;
        }

        _gradientLayer.frame=self.bounds;

    }];
    
}


@end

//
//  XQMenuView.m
//  MenuBtn
//
//  Created by Xia_Q on 16/3/1.
//  Copyright © 2016年 asiainfo. All rights reserved.
//

#import "XQMenuView.h"

@implementation XQMenuView

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        float x=frame.size.width;
        _menuImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, x-20, x-20)];
        [_menuImage.layer setCornerRadius:(x-20)/2.0];
        _menuImage.backgroundColor=[UIColor greenColor];
        [_menuImage clipsToBounds];
        [self addSubview:_menuImage];
        
        _titleLable=[[UILabel alloc]initWithFrame:CGRectMake(0, x, x, 20)];
        _titleLable.backgroundColor=[UIColor yellowColor];
        [self addSubview:_titleLable];
        
        _lineView=[[UIView alloc]initWithFrame:CGRectMake(10, x+15, x-20, 1)];
        _lineView.backgroundColor=[UIColor redColor];
        [self addSubview:_lineView];
        
    }
    return self;
}

@end

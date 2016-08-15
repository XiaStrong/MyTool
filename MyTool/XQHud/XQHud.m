//
//  XQHud.m
//  AFtest
//
//  Created by Xia_Q on 15/12/1.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import "XQHud.h"
@implementation XQHud

+ (XQHud *)showHudAddedTo:(UIView *)view withText:(NSString *)text
{
    view.userInteractionEnabled=NO;
    XQHud *hud=[[self alloc]initWithFrame:CGRectMake(XW/2-40, XH/2-40, 80, 80) withText:text];
    [hud startAnimation];
    [view addSubview:hud];
    return hud;
}

+ (NSInteger)hideAllHudsForView:(UIView *)view withText:(NSString *)text
{
    view.userInteractionEnabled=YES;
    NSArray *huds=[XQHud allHUDsForView:view];
    for (XQHud *hud in huds) {
        [hud stopAnimationWithLoadText:text];
    }
    return huds.count;
}

+ (NSArray *)allHUDsForView:(UIView *)view {
    NSMutableArray *huds = [NSMutableArray array];
    NSArray *subviews = view.subviews;
    for (UIView *aView in subviews) {
        if ([aView isKindOfClass:self]) {
            [huds addObject:aView];
        }
    }
    return [NSArray arrayWithArray:huds];
}


-(id)initWithFrame:(CGRect)frame withText:(NSString *)text
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, frame.size.width,frame.size.height-10)];
        [self addSubview:_imageView];
        NSMutableArray *image=[[NSMutableArray alloc]init];
        for (int i=1 ; i<=4; i++) {
            [image addObject:[UIImage imageNamed:[NSString stringWithFormat:@"loading_%d",i]]];
        }
        //设置动画帧
        _imageView.animationImages= image;
        
        
        infoLable = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-20, frame.size.width, 20)];
        infoLable.backgroundColor = [UIColor clearColor];
        infoLable.textAlignment = NSTextAlignmentCenter;
        infoLable.textColor = [UIColor colorWithRed:84.0/255 green:86./255 blue:212./255 alpha:1];
        infoLable.font = [UIFont fontWithName:@"ChalkboardSE-Bold" size:14.0f];
        [self addSubview:infoLable];
        
        self.layer.hidden = YES;
        
        if (text) {
            infoLable.text=text;
        }else
        {
            infoLable.text=@"";
        }
        
    }
    return self;
}

-(void)stopAnimationWithLoadText:(NSString *)text
{
    infoLable.text=text;
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [_imageView stopAnimating];
        self.layer.hidden = YES;
        self.alpha = 1;
        [self removeFromSuperview];
    }];

}

-(void)startAnimation
{
    self.layer.hidden = NO;
    _imageView.animationDuration=1.0;
    _imageView.animationRepeatCount=0;
    [_imageView startAnimating];
}


@end

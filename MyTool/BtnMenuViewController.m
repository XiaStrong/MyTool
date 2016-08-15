//
//  BtnMenuViewController.m
//  MyTool
//
//  Created by Xia_Q on 16/8/12.
//  Copyright © 2016年 X. All rights reserved.
//

#import "BtnMenuViewController.h"
#import "XQMenuView.h"

@interface BtnMenuViewController ()
{
    int tmptag ;
    
}
@property(nonatomic,strong)NSMutableArray * myxRects;//存放所有的view
@property(nonatomic,strong)NSMutableArray * xframes;//存放view的标准位置

@property(nonatomic,strong)NSMutableArray * mywRects;//存放所有的view
@property(nonatomic,strong)NSMutableArray * wframes;//存放view的标准位置

@property(nonatomic,strong)NSMutableArray *myRects;
@property(nonatomic,strong)NSMutableArray *frames;
@end

@implementation BtnMenuViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    //    float w=(xWidth-20)/4.0;
    //    float h=w+20;
    //    for (int i= 0; i<8; i++) {
    //        int x= i/4;//行
    //        int y= i%4;//列
    //
    //        XQMenuView *view=[[XQMenuView alloc]initWithFrame:CGRectMake(10+y*w, x*h, w, h)];
    //        [self.view addSubview:view];
    //    }
    
    _myxRects=[[NSMutableArray alloc]init];
    _xframes=[[NSMutableArray alloc]init];
    _mywRects=[[NSMutableArray alloc]init];
    _wframes=[[NSMutableArray alloc]init];
    
    
    _myRects=[[NSMutableArray alloc]init];
    _frames=[[NSMutableArray alloc]init];
    UIView *xuanView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XW, 30)];
    xuanView.backgroundColor=[UIColor redColor];
    [self.view addSubview:xuanView];
    
    
    UIView *weixuanView=[[UIView alloc]initWithFrame:CGRectMake(0, 200, XW, 30)];
    weixuanView.backgroundColor=[UIColor redColor];
    [self.view addSubview:weixuanView];
    
    
    float w=(XW-50)/4.0;
    float h=30;
    for (int i= 0; i<7; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 15;
        button.tag = i;
        button.backgroundColor = [UIColor brownColor];
        [button setTitle:[NSString stringWithFormat:@"btn %d",i] forState:UIControlStateNormal];
        [self.myxRects addObject:button];
        button.frame=CGRectMake(10+(w+10)*(i%4), 50+i/4*(h+20), w, h);
        NSString * str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(button.frame)];
        [self.xframes addObject:str];
        //        NSLog(@"%f",50+i/4*(h+20));
        
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragButton:)];
        [button addGestureRecognizer:pan];
        [self.view addSubview:button];
        
    }
    
    [_myRects addObjectsFromArray:_myxRects];
    [_frames addObjectsFromArray:_xframes];
    
    for (int i=0; i<8; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 15;
        button.tag = i+7;
        button.backgroundColor = [UIColor brownColor];
        [button setTitle:[NSString stringWithFormat:@"btn %d",i+7] forState:UIControlStateNormal];
        [self.mywRects addObject:button];
        button.frame=CGRectMake(10+(w+10)*(i%4), 250+i/4*(h+20), w, h);
        NSString * str = [NSString stringWithFormat:@"%@",NSStringFromCGRect(button.frame)];
        [self.wframes addObject:str];
        //        NSLog(@"%f",50+i/4*(h+20));
        
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(dragButton:)];
        [button addGestureRecognizer:pan];
        [self.view addSubview:button];
        
    }
    
    [_myRects addObjectsFromArray:_mywRects];
    [_frames addObjectsFromArray:_wframes];
    
    NSLog(@"%d",_myRects.count);
}





-(void)dragButton:(UIPanGestureRecognizer*)pan
{
    //获取手势在该视图上得偏移量
    CGPoint translation = [pan translationInView:self.view];
    //一下分别为拖动时的三种状态：开始，变化，结束
    if (pan.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"drag begin");
        //开始时拖动的view更改透明度
        pan.view.alpha = 0.7;
    }
    else if(pan.state == UIGestureRecognizerStateChanged)
    {
        pan.view.center = CGPointMake(pan.view.center.x + translation.x,
                                      pan.view.center.y + translation.y);
        [pan setTranslation:CGPointZero inView:self.view];
        for (int i = 0; i< self.myRects.count; i++)
            
            
        {
            UIButton * btn = self.myRects[i];
            NSString* tmprect = self.frames[i];
            if (CGRectContainsPoint(CGRectFromString(tmprect), pan.view.center))
            {
                
                tmptag = (int)btn.tag;
                // NSLog(@"tmptag ==> %d",tmptag);
                btn.layer.borderWidth = 1;
                btn.layer.borderColor = [[UIColor redColor]CGColor];
                return;
            }
            else
            {
                btn.layer.borderWidth = 0;
                btn.layer.borderColor = [[UIColor clearColor]CGColor];
            }
        }
        //        for (UIView *view in self.view.subviews) {
        //            if ([view isKindOfClass:[UIButton class]]) {
        //                UIButton *btn=(UIButton *)view;
        //                NSString *tmprect=btn.frame;
        //            }
        //        }
    }
    else if (pan.state == UIGestureRecognizerStateEnded)
    {
        pan.view.alpha = 1;
        [UIView animateWithDuration:0.5f animations:^
         {
             //结束时将选中view的边框还原
             UIButton * btn = self.myRects[tmptag];
             btn.layer.borderWidth = 0;
             btn.layer.borderColor = [[UIColor clearColor]CGColor];
             
             //获取需要交换的两个view的frame，并交换
             NSString * rect1 = self.frames[btn.tag];
             NSString * rect2 = self.frames[pan.view.tag];
             
             pan.view.frame = CGRectFromString(rect1);
             btn.frame = CGRectFromString(rect2);
             
             //并交换其tag值及在数组中得位置
             int tmp = (int)pan.view.tag;
             pan.view.tag = tmptag;
             btn.tag = tmp;
             //NSLog(@"%d  %d",pan.view.tag,btn.tag);
             
             [self.myRects exchangeObjectAtIndex:pan.view.tag withObjectAtIndex:btn.tag];
             
             
         } completion:^(BOOL finished)
         {
             NSLog(@"已交换");
             //完成动画后还原btn的状态
             for (int i = 0; i< self.myRects.count; i++)
             {
                 
                 UIButton * btn = self.myRects[i];
                 btn.layer.borderColor = [[UIColor clearColor]CGColor];
                 btn.layer.borderWidth = 0;
                 //                             NSLog(@"ttttr%d",btn.tag);
             }
         }];
        
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

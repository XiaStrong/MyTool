//
//  VFLViewController.m
//  MyTool
//
//  Created by Xia_Q on 16/8/10.
//  Copyright © 2016年 X. All rights reserved.
//

#import "VFLViewController.h"

@interface VFLViewController ()

@end

@implementation VFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self add1]; //下面的两个控件
    [self add2]; //上面的两个控件
    [self add3];
    // Do any additional setup after loading the view from its nib.
}

-(void)add3{
    UIView *view0 =[[UIView alloc]init];
    view0.backgroundColor=[UIColor redColor];
    view0.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view0];
    
    UIView *view1 =[[UIView alloc]init];
    view1.backgroundColor=[UIColor blueColor];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view1];
    
    UIView *view2 =[[UIView alloc]init];
    view2.backgroundColor=[UIColor greenColor];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view2];
    
    CGFloat x=[UIScreen mainScreen].bounds.size.width;
    float a=x/13.0;
    NSString *ystr=[NSString stringWithFormat:@"%f",a];
    NSString *hvfl=@"H:|-a-[view0]-a-[view1(==view0)]-a-[view2(==view0)]-a-|";
    NSArray *hcons =[ NSLayoutConstraint constraintsWithVisualFormat:hvfl
                                                             options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom
                                                             metrics:@{@"a":ystr}
                                                               views:NSDictionaryOfVariableBindings(view0,view1,view2)];
    [self.view addConstraints:hcons];
    float W= (x-4*a)/3.0;
    NSString *Wstr=[NSString stringWithFormat:@"%f",W];
    NSString *vvfl=@"V:|-200-[view0(==W)]";
    NSArray *vcons =[ NSLayoutConstraint constraintsWithVisualFormat:vvfl
                                                             options:0
                                                             metrics:@{@"W":Wstr}
                                                               views:NSDictionaryOfVariableBindings(view0)];
    [self.view addConstraints:vcons];
}
//    UITextField *tf=[[UITextField alloc]initWithFrame:CGRectMake(20, 200, x-40, 30)];
//    tf.backgroundColor=[UIColor yellowColor];
//    [self.view addSubview:tf];
//    [tf addTarget:self action:@selector(update)
//               forControlEvents:UIControlEventEditingChanged];
//    [tf addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//

//-(void)update{
//    NSLog(@"123");
//}
//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    NSLog(@"123");
//
//    if ([keyPath isEqualToString:@"text"]) {
//        NSLog(@"%@",[change objectForKey:@"new"]);
//    }
//}

-(void)add1{
    //1.添加两个控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    //2.添加约束
    //2.1水平方向的约束
    NSString *hVFL = @"H:|-30-[blueView]-30-[redView(==blueView)]-30-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL
                                                             options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop
                                                             metrics:nil
                                                               views:@{@"blueView":blueView, @"redView":redView}];
    [self.view addConstraints:hCons];
    
    //2.2垂直方向的约束
    NSString *vVFL = @"V:[blueView(50)]-30-|";
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL
                                                             options:0
                                                             metrics:nil
                                                               views:@{@"blueView":blueView}];
    [self.view addConstraints:vCons];
}

-(void)add2{
    //1.添加两个控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    //2.添加约束
    //2.1水平方向的约束
    NSString *hVFL = @"H:|-30-[blueView]-30-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL
                                                             options:0
                                                             metrics:nil
                                                               views:@{@"blueView":blueView}];
    [self.view addConstraints:hCons];
    
    //2.2垂直方向的约束
    NSString *vVFL = @"V:|-30-[blueView(50)]-30-[redView(==blueView)]";
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL
                                                             options:NSLayoutFormatAlignAllRight
                                                             metrics:nil
                                                               views:NSDictionaryOfVariableBindings(blueView,redView)];
    [self.view addConstraints:vCons];
    NSLayoutConstraint *redLeftCon = [NSLayoutConstraint constraintWithItem:redView
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:blueView
                                                                  attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:redLeftCon];
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

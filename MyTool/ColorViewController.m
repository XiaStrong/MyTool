//
//  ColorViewController.m
//  MyTool
//
//  Created by Xia_Q on 16/8/10.
//  Copyright © 2016年 X. All rights reserved.
//

#import "ColorViewController.h"
#import "UIColor+XQColor.h"
@interface ColorViewController ()

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel *lable1=[[UILabel alloc]initWithFrame:CGRectMake(10, 30, 200, 21)];
    lable1.text=@"字符串#0caa5e颜色";
    [self.view addSubview:lable1];
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake( 10, 60, 200, 20)];
    view.backgroundColor=[UIColor colorFromHexString:@"#0caa5e"];
    [self.view addSubview:view];
    
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel *lable2=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 200, 21)];
    lable2.text=@"RGB颜色12，170，94";
    [self.view addSubview:lable2];

    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake( 10, 120, 200, 20)];
    view1.backgroundColor=[UIColor colorWithR:12 G:170 B:94 A:1];
    [self.view addSubview:view1];

    // Do any additional setup after loading the view.
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

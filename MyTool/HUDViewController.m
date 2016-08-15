//
//  HUDViewController.m
//  MyTool
//
//  Created by Xia_Q on 16/8/12.
//  Copyright © 2016年 X. All rights reserved.
//

#import "HUDViewController.h"

@interface HUDViewController ()
{
    XQHud *hud;
}
@end

@implementation HUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(startLocation)];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(stopLocation)];
    self.navigationItem.rightBarButtonItems=@[item,item1];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)startLocation{
    
    [XQHud showHudAddedTo:self.view withText:@"呵呵,加载中"];

}

- (void)stopLocation{
    [XQHud hideAllHudsForView:self.view withText:@"拜拜"];
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

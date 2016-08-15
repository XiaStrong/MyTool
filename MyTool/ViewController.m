//
//  ViewController.m
//  MyTool
//
//  Created by Xia_Q on 16/8/10.
//  Copyright © 2016年 X. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"
#import "GDMapViewController.h"
#import "ColorViewController.h"
#import "VFLViewController.h"
#import "HUDViewController.h"
#import "TimePickerViewController.h"
#import "BtnMenuViewController.h"
@interface ViewController ()
{
    NSArray *dataArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"工具";
    
    self.navigationController.navigationBar.translucent = NO;

    _myTab.delegate=self;
    _myTab.dataSource=self;
    
    dataArr=@[@"GPS坐标",@"高德简单使用",@"两种方式设置颜色",@"VFL语句简单使用",@"自定义的HUD",@"TimePicker",@"BtnMenu互换位置"];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *str =@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text=dataArr[indexPath.row];
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        MapViewController *vc=[[MapViewController alloc]init];
        vc.pageTitle=dataArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 1){
        GDMapViewController *vc =[[GDMapViewController alloc]init];
        vc.pageTitle=dataArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];

    }
    
    if (indexPath.row == 2) {
        ColorViewController *vc=[[ColorViewController alloc]init];
        vc.pageTitle=dataArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    if (indexPath.row == 3) {
        VFLViewController *vc=[[VFLViewController alloc]init];
        vc.pageTitle=dataArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 4) {
        HUDViewController *vc=[[HUDViewController alloc]init];
        vc.pageTitle=dataArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row == 5) {
        TimePickerViewController *vc =[[TimePickerViewController alloc]init];
        vc.pageTitle=dataArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.row ==6) {
        BtnMenuViewController *vc = [[BtnMenuViewController alloc]init];
        vc.pageTitle=dataArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

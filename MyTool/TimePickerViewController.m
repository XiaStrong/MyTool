//
//  TimePickerViewController.m
//  MyTool
//
//  Created by Xia_Q on 16/8/12.
//  Copyright © 2016年 X. All rights reserved.
//

#import "TimePickerViewController.h"

@interface TimePickerViewController ()
{
    XQTimePicker *picker;
}
@end

@implementation TimePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *date=[NSDate date];
    
    picker=[[XQTimePicker alloc]initDatePickWithDate:date datePickerMode:UIDatePickerModeDate withMinDate:nil MaxData:nil];
    picker.delegate=self;

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)toolbarBtnClick:(XQTimePicker*)pickView BackString:(NSString *)resultString{
    NSLog(@"%@",resultString);
    _timeLable.text=resultString;
}


- (IBAction)show:(id)sender {
    _timeLable.text=@"";
    [picker show];
}

- (IBAction)stop:(id)sender {
    _timeLable.text=@"";
    [picker remove];
}
@end

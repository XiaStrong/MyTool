//
//  TimePickerViewController.h
//  MyTool
//
//  Created by Xia_Q on 16/8/12.
//  Copyright © 2016年 X. All rights reserved.
//

#import "MainViewController.h"
#import "XQTimePicker.h"
@interface TimePickerViewController : MainViewController<XQTimePickerDelegate>
- (IBAction)show:(id)sender;
- (IBAction)stop:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@end

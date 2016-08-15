//
//  ViewController.h
//  MyTool
//
//  Created by Xia_Q on 16/8/10.
//  Copyright © 2016年 X. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTab;

@end


//
//  MapViewController.h
//  MyTool
//
//  Created by Xia_Q on 16/8/10.
//  Copyright © 2016年 X. All rights reserved.
//

#import "MainViewController.h"
#import "MapLocation.h"

@interface MapViewController : MainViewController<MapLocationDelegate>
- (IBAction)btnTouch:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *placeLable;

@end

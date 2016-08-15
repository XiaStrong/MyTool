//
//  MapViewController.m
//  MyTool
//
//  Created by Xia_Q on 16/8/10.
//  Copyright © 2016年 X. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)btnTouch:(id)sender {
    MapLocation *location=[MapLocation sharedInstance];
    location.delegate=self;
    [location testLocation];
    
}


-(void)getLocation:(CLLocationCoordinate2D)coordinate{
    NSString *show=[NSString stringWithFormat:@"x:%f-----y:%f",coordinate.latitude,coordinate.longitude];
    _placeLable.text= show;
}
@end

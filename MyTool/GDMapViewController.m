//
//  GDMapViewController.m
//  MyTool
//
//  Created by Xia_Q on 16/8/10.
//  Copyright © 2016年 X. All rights reserved.
//

#import "GDMapViewController.h"

@interface GDMapViewController ()<GDLocationDelegate>
{
    XQMapView *map;
    CLLocationCoordinate2D myCoordinate;
}

@end

@implementation GDMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    map=[[XQMapView alloc]initWithFrame:CGRectMake(0, 0, XW, XH-64)];
    [self.view addSubview:map];
    
    GDLocation *location=[GDLocation sharedInstance];
    location.delegate=self;
    [location getGDPlace];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(startLocation)];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(stopLocation)];
    self.navigationItem.rightBarButtonItems=@[item,item1];
    
    myCoordinate.latitude=23.119090;
    myCoordinate.longitude=113.653494;

    // Do any additional setup after loading the view from its nib.
}

-(void)getLocationPlaceModel:(GDBackPlaceModel *)placeModel{
    myCoordinate=placeModel.coordinate;
}


-(void)stopLocation{
    [map stopLocation];
}

-(void)startLocation{
    [map showPlaceInMap];
    [map creatAnnotationWithCoordinate:myCoordinate title:@"目地" subtitle:@"呼啦啦"];
    
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

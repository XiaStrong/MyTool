//
//  XQMapView.h
//  GDmap
//
//  Created by Xia_Q on 16/7/26.
//  Copyright © 2016年 X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>

@interface XQMapView : UIView<MAMapViewDelegate>

@property(nonatomic,strong)MAMapView *mapView;

-(void)startLocation;

-(void)stopLocation;

-(void)showPlaceInMap;

-(void)creatAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle;

@end

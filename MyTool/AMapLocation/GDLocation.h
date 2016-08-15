//
//  GDLocation.h
//  WNMPro
//
//  Created by Xia_Q on 16/7/14.
//  Copyright © 2016年 亚信. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDBackPlaceModel.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

@protocol GDLocationDelegate <NSObject>

//未成功获取，返回error
-(void)doNotGetPlaceNoticeWithError:(NSError *)error;


@optional
//同时获取地点和坐标
-(void)getLocationPlaceModel:(GDBackPlaceModel *)placeModel;
//获取地点
-(void)getLocationPlace:(NSString *)place;

@end

@interface GDLocation : NSObject<MAMapViewDelegate,AMapSearchDelegate>

@property (nonatomic,weak) id<GDLocationDelegate>delegate;

+ (instancetype) sharedInstance;

-(void)getGDPlace;

-(void)getLocationPlaceWith:(CLLocationCoordinate2D)coordinate;

/*
    判断两个左边之间的距离是否大于某个值的方法
    当meter传入的值小于等于0时，默认为距离200内
 */
+ (BOOL)whetherDistanceBiggerThanMeter:(int)meter withFromCLLocationCoordinate2D:(CLLocationCoordinate2D)from toCLLocationCoordinate2D:(CLLocationCoordinate2D)to;

@property(nonatomic)int state; //状态标志，为0，则返回GDBackPlaceModel，为1只返回place
@property(nonatomic,strong)MAMapView *map;
@property(nonatomic,strong)AMapSearchAPI *search;
@property(nonatomic,strong)GDBackPlaceModel *placeModel;


@end

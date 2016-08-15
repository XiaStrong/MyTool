//
//  MapLocation.h
//  Map
//
//  Created by Xia_Q on 16/7/11.
//  Copyright © 2016年 X. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

/*
 需要添加CoreLocation.framework
 适配iOS8要修改plist
 */

@protocol MapLocationDelegate <NSObject>

-(void)getLocation:(CLLocationCoordinate2D)coordinate;

@end

@interface MapLocation : NSObject <CLLocationManagerDelegate>

@property (nonatomic,strong)CLLocationManager *manager;

@property (nonatomic,weak) id<MapLocationDelegate>delegate;

+ (instancetype) sharedInstance;

-(void) testLocation;


@end

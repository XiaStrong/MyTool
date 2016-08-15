//
//  MapLocation.m
//  Map
//
//  Created by Xia_Q on 16/7/11.
//  Copyright © 2016年 X. All rights reserved.
//

#import "MapLocation.h"

@implementation MapLocation

+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    static id sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


-(id)init{
    
    if (self=[super init]) {
        _manager =[[CLLocationManager alloc]init];
        [_manager setDelegate: self];
    }
    return  self;
}


-(void) testLocation{
    //检测定位服务是否可用
    if(![CLLocationManager locationServicesEnabled]){
        NSLog(@"定位不可用");
        return;
    }
    //设置定位希望的精度
    _manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([self.manager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.manager requestAlwaysAuthorization];
    }
    
    //启动定位
    [_manager startUpdatingLocation];
    
}

//代理方法, 在位置更新后执行
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    CLLocation *newLocation = locations[0];
    // 位置反编码
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error){
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        NSLog(@"%@", placemark.name);// 详细位置
        NSLog(@"%@",placemark.country);// 国家
        NSLog(@"%@",placemark.locality);// 市
        NSLog(@"%@",placemark.subLocality);// 区
        NSLog(@"%@",placemark.thoroughfare);// 街道
        NSLog(@"%@",placemark.subThoroughfare);// 子街道
    }];
    
    // CLLocation表示位置(包含经纬度)
    CLLocation *location = manager.location;
    //获取经纬度
    CLLocationCoordinate2D coordinate = location.coordinate;
    //显示
//        NSLog(@"纬度，经度%f,%f",coordinate.latitude,coordinate.longitude);
    
    
    [self.delegate getLocation:coordinate];
    
    //定位只需要一次, 停止定位
    [_manager stopUpdatingLocation];
}


// 定位失误时触发
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error:%@",error);
}

@end

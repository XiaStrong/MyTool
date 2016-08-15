//
//  GDLocation.m
//  WNMPro
//
//  Created by Xia_Q on 16/7/14.
//  Copyright © 2016年 亚信. All rights reserved.
//

#import "GDLocation.h"

@implementation GDLocation


+ (instancetype) sharedInstance {
    static dispatch_once_t onceToken;
    static id sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}



+ (BOOL)whetherDistanceBiggerThanMeter:(int)meter withFromCLLocationCoordinate2D:(CLLocationCoordinate2D)from toCLLocationCoordinate2D:(CLLocationCoordinate2D)to{
    //1.将两个经纬度点转成投影点
    MAMapPoint point1 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(from.longitude,from.latitude));
    MAMapPoint point2 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(to.longitude,to.latitude));
    //2.计算距离
    CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
    NSLog(@"%f",distance);
    
    if(meter <=0){
        //当传入的值为小于等于0的数值时，默认判断距离为200
        if (distance >200) {
            return YES;
        }else{
            return NO;
        }
    }else{
        //当传入的值为大于0的int类型时，则以实际传入值为判断距离
        if (distance>meter) {
            return YES;
        }else{
            return NO;
        }
    }
}

-(id)init{
    if (self = [super init]) {
        
        [MAMapServices sharedServices].apiKey = kMAMAP_AppKey;
        [AMapSearchServices sharedServices].apiKey=kMAMAP_AppKey;
        
        _map =[[MAMapView alloc]init];
        _map.delegate=self;
        
        _placeModel=[[GDBackPlaceModel alloc]init];
        
    }
    return self;
}


-(void)getGDPlace{
    _state = 0;
    _map.showsUserLocation = YES;
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{

    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"高德前位置的坐标 ===latitude : %.9f,longitude: %.9f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        
        CLLocationCoordinate2D Coordinate =userLocation.coordinate;
        _placeModel.coordinate=Coordinate;
        
        _search=[[AMapSearchAPI alloc] init];
        _search.delegate=self;
        AMapReGeocodeSearchRequest *regeoRequest = [[AMapReGeocodeSearchRequest alloc] init];
        regeoRequest.location = [AMapGeoPoint locationWithLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude];
        regeoRequest.radius = 100;
        regeoRequest.requireExtension= YES;
        [_search AMapReGoecodeSearch: regeoRequest];
        _map.showsUserLocation = NO;
    }
}

- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"----Error:%@", [error description]);
//    [self.delegate doNotGetPlaceNoticeWithError:error];
}

- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    //实现逆地理编码的回调函数
    if(response.regeocode != nil)
    {
        
        AMapReGeocode* revResult = response.regeocode;
        
        
        NSString *currentUserAddressValue = [NSString stringWithFormat:@"%@%@%@%@%@",
                                             revResult.addressComponent.province,
                                             revResult.addressComponent.city,
                                             revResult.addressComponent.district,
                                             revResult.addressComponent.township,
                                             revResult.addressComponent.neighborhood
                                             ];
        
        if ([revResult.roads count])
        {
            AMapRoad *revRoad = [revResult.roads objectAtIndex:0];
            currentUserAddressValue = [currentUserAddressValue stringByAppendingFormat:@"%@", revRoad.name];
        }
        
        _placeModel.place=[NSString stringWithFormat:@"%@",currentUserAddressValue];

        if (_state == 0) {
            
            [self.delegate getLocationPlaceModel:_placeModel];
        }
        
        if (_state == 1) {
            [self.delegate getLocationPlace:currentUserAddressValue];
        }
        
        

    }
}


-(void)getLocationPlaceWith:(CLLocationCoordinate2D)coordinate{
    _state = 1;
    _search=[[AMapSearchAPI alloc] init];
    _search.delegate=self;
    AMapReGeocodeSearchRequest *regeoRequest = [[AMapReGeocodeSearchRequest alloc] init];
    regeoRequest.location = [AMapGeoPoint locationWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    regeoRequest.radius = 100;
    regeoRequest.requireExtension= YES;
    [_search AMapReGoecodeSearch: regeoRequest];
    _map.showsUserLocation = NO;

}

@end

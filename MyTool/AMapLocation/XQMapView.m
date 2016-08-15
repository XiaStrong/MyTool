//
//  XQMapView.m
//  GDmap
//
//  Created by Xia_Q on 16/7/26.
//  Copyright © 2016年 X. All rights reserved.
//

#import "XQMapView.h"
@implementation XQMapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _mapView = [[MAMapView alloc] initWithFrame:frame];
        _mapView.delegate = self;
        _mapView.showsScale=YES;
        _mapView.mapType =MAMapTypeStandard;
//        [_mapView setZoomLevel:5];//设置缩放级别，感觉没什么卵用
//        _mapView.showTraffic= YES;//显示实时交通路况
//        _mapView.customizeUserLocationAccuracyCircleRepresentation = YES;
        [self addSubview:_mapView];
        
        
//        UILongPressGestureRecognizer* createLocation = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
//        createLocation.minimumPressDuration = 0.5;
//        createLocation.delegate = self;
//        [_mapView addGestureRecognizer:createLocation];
//        
//        [self performSelector:@selector(jumpToCurrentUserLocation:) withObject:nil afterDelay:1.0];

    }
    return self;
}

-(void)creatAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle{
    
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = coordinate;
    pointAnnotation.title = title;
    pointAnnotation.subtitle = subtitle;
    [_mapView addAnnotation:pointAnnotation];
    [_mapView setSelectedAnnotations:@[pointAnnotation]];
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(coordinate.latitude,coordinate.longitude);
    MACoordinateSpan span = MACoordinateSpanMake(0.01, 0.01);
    MACoordinateRegion region = MACoordinateRegionMake(center, span);
    [_mapView setRegion:region animated:YES];

}

//设置标注的各种性能
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        return annotationView;
    }
    return nil;
}


-(void)startLocation{
    _mapView.showsUserLocation = YES;
}

-(void)stopLocation{
    _mapView.showsUserLocation = NO;
}

-(void)showPlaceInMap{
    _mapView.showsUserLocation = YES;
    [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES]; //地图跟着位置移动，调用这个方法会实现定位的方法
    
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
}

/*
若自定义定位经度圈样式，需将 MAMapView 的customizeUserLocationAccuracyCircleRepresentation 属性设置为 YES。
 */

//- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
//{
//    /* 自定义定位精度对应的MACircleView. */
//    if (overlay == mapView.userLocationAccuracyCircle)
//    {
//        MACircleRenderer *accuracyCircleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
//        
//        accuracyCircleRenderer.lineWidth    = 2.f;
//        accuracyCircleRenderer.strokeColor  = [UIColor lightGrayColor];
//        accuracyCircleRenderer.fillColor    = [UIColor colorWithRed:1 green:0 blue:0 alpha:.3];
//        
//        return accuracyCircleRenderer;
//    }
//    
//    return nil;
//}
//
//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
//{
//    /* 自定义userLocation对应的annotationView. */
//    if ([annotation isKindOfClass:[MAUserLocation class]])
//    {
//        static NSString *userLocationStyleReuseIndetifier = @"userLocationStyleReuseIndetifier";
//        MAAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:userLocationStyleReuseIndetifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
//                                                          reuseIdentifier:userLocationStyleReuseIndetifier];
//        }
//        annotationView.image = [UIImage imageNamed:@"userPosition"];
//        
//        return annotationView;
//    }
//    return nil;
//}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

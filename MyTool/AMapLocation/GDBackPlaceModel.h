//
//  GDBackPlaceModel.h
//  WNMPro
//
//  Created by Xia_Q on 16/7/14.
//  Copyright © 2016年 亚信. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface GDBackPlaceModel : NSObject

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic,strong)NSString *place;

@end

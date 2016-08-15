//
//  UIColor+XQColor.h
//  Color
//
//  Created by Xia_Q on 16/7/1.
//  Copyright © 2016年 X. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XQColor)

+ (instancetype)colorFromHexString:(NSString *)hexString;

+ (instancetype)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;

@end

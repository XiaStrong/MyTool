//
//  XQGDWayWebView.h
//  WNMPro
//
//  Created by Xia_Q on 16/7/22.
//  Copyright © 2016年 亚信. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQGDWayWebView : UIWebView

typedef NS_ENUM(NSInteger, type) {
    walk = 0,
    bus = 1,
    car = 2,
};

@property(nonatomic,strong)UIProgressView *progress;

/*
    参数一 参数二：起始地横纵坐标，由float数值转成的字符串
    参数三 参数四：目的地横纵坐标，由float数值转成的字符串
    参数五：路径形式，只可以为car,bus,walk三种
    参数六：目的地名称
 */
-(void)creatWebWith_startLongitude:(NSString *)slong startLatitude:(NSString *)sla endLongitude:(NSString *)elong endLatitude:(NSString *)ela withGoType:(type)type destName:(NSString *)destName;

//停止进度条，在webView加载完成/加载出错的时候调用
-(void)stopRunProgress;

@end

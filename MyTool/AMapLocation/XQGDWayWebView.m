//
//  XQGDWayWebView.m
//  WNMPro
//
//  Created by Xia_Q on 16/7/22.
//  Copyright © 2016年 亚信. All rights reserved.
//

#import "XQGDWayWebView.h"

@implementation XQGDWayWebView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _progress=[[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 4)];
        _progress.progress=0.0f;
        //右边部分颜色
        _progress.trackTintColor = [UIColor yellowColor];
        //左边部分颜色
        _progress.progressTintColor = [UIColor orangeColor];
        _progress.hidden=NO;
        [self addSubview:_progress];
    }
    return self;
}


-(void)stopRunProgress{
    _progress.progress=1.0;
    
    [self performSelector:@selector(hid) withObject:nil afterDelay:0.2f];

}

-(void)hid{
    _progress.hidden=YES;
}

-(void)runProgress{
    if (_progress.progress <=0.8) {
        float a =arc4random()%4/10.0+_progress.progress;
        if (a>=0.8) {
            _progress.progress=0.8;
        }else{
            _progress.progress=a;

        }
    }
}

-(void)creatWebWith_startLongitude:(NSString *)slong startLatitude:(NSString *)sla endLongitude:(NSString *)elong endLatitude:(NSString *)ela withGoType:(type)type destName:(NSString *)destName{

    [NSTimer scheduledTimerWithTimeInterval:0.8f target:self selector:@selector(runProgress) userInfo:nil repeats:YES];
    
    NSString *dest=[destName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlStr;
    if (type == 0) {
        urlStr = [NSString stringWithFormat:@"http://m.amap.com/navi/?start=%@,%@&dest=%@,%@&destName=%@&naviBy=walk&key=%@",slong,sla,elong,ela,dest,kMAP_WebLocationKey];
    }else if(type == 1){
        urlStr = [NSString stringWithFormat:@"http://m.amap.com/navi/?start=%@,%@&dest=%@,%@&destName=%@&naviBy=bus&key=%@",slong,sla,elong,ela,dest,kMAP_WebLocationKey];
    }else{
        urlStr = [NSString stringWithFormat:@"http://m.amap.com/navi/?start=%@,%@&dest=%@,%@&destName=%@&naviBy=car&key=%@",slong,sla,elong,ela,dest,kMAP_WebLocationKey];
    }
    
    NSLog(@"%@",urlStr);
    
    
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

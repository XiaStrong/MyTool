//
//  ImageBtn.m
//  XQRecordView
//
//  Created by Xia_Q on 16/8/5.
//  Copyright © 2016年 X. All rights reserved.
//

#import "ImageBtn.h"

@implementation ImageBtn

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _img=[[UIImageView alloc]init];
        _img.frame=self.bounds;
        [self addSubview:_img];
    }
    return self;
}

@end

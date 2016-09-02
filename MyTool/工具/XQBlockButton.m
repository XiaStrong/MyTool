//
//  XQBlockButton.m
//  XQBlockBtn
//
//  Created by Xia_Q on 16/9/2.
//  Copyright © 2016年 X. All rights reserved.
//

#import "XQBlockButton.h"

@implementation XQBlockButton

- (void)touchWithAction:(action)blockAction
{
    self.blockAction=blockAction;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(UIButton *)button
{
    self.blockAction(button);
}

@end

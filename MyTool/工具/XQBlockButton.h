//
//  XQBlockButton.h
//  XQBlockBtn
//
//  Created by Xia_Q on 16/9/2.
//  Copyright © 2016年 X. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^action)(UIButton *button);

@interface XQBlockButton : UIButton

@property(nonatomic,copy)action blockAction;

- (void)touchWithAction:(action)blockAction;

@end





//
//  XQHud.h
//  AFtest
//
//  Created by Xia_Q on 15/12/1.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MBProgressHUD.h"

@interface XQHud : UIView
{
    UILabel *infoLable;
}

@property(nonatomic, strong)UIImageView *imageView;

+ (XQHud *)showHudAddedTo:(UIView *)view withText:(NSString *)text;
+ (NSInteger)hideAllHudsForView:(UIView *)view withText:(NSString *)text;


-(id)initWithFrame:(CGRect)frame withText:(NSString *)text;
-(void)startAnimation;
-(void)stopAnimationWithLoadText:(NSString *)text;



@end

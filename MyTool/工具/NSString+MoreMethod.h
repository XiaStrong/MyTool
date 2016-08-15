//
//  NSString+MoreMethod.h
//  bajieyuerBTeam
//
//  Created by Xia_Q on 15/12/3.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MoreMethod)

#pragma mark-检验是不是数字
+ (BOOL)validateNumber:(NSString*)number;

//简单的判断是不是手机号
+ (BOOL)isPhoneNumber:(NSString *)phoneNum;


//判断是不是电话号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum ;



@end

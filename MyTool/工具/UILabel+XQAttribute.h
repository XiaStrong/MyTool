//
//  UILabel+XQAttribute.h
//  AFtest
//
//  Created by Xia_Q on 15/11/3.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XQAttribute)


/*
 //str 得到的字符串
 //font 字体
 //x 段距
 //y 行距
 //width lable的宽度
 */
+(CGSize)getStr:(NSString *)str getFont:(UIFont *)font getWidth:(CGFloat)width;


+(NSAttributedString *)getString:(NSString *)str andFont:(UIFont *)font paragraphSpacing:(CGFloat)x withlineSpacing:(CGFloat)y;

+(CGRect)getStr:(NSString *)str getFont:(UIFont *)font getWidth:(CGFloat)width paragraphSpacing:(CGFloat)x andLineSpacing:(CGFloat)y;

//将一段话里面的部分相同字改变颜色
+(NSMutableAttributedString *)changeText:(NSString *)text fromContent:(NSString *)content withColor:(UIColor *)color;
@end

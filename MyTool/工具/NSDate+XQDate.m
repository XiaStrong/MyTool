//
//  NSDate+XQDate.m
//  AFtest
//
//  Created by Xia_Q on 15/11/17.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import "NSDate+XQDate.h"

@implementation NSDate (XQDate)

+(NSDate *)getLocalDate
{
    NSDate *date =[NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}


+(NSDate *)spaceTimeToNowWithDay:(int)x
{
    NSDate *now =[NSDate date];
    NSDate *date=[now dateByAddingTimeInterval:60*60*24*x];
    return date;
}

+(NSDate *)spaceTimeToDate:(NSDate *)startDate WithYear:(int)q Day:(int)x Hour:(int)y Minute:(int)z
{
    NSDateComponents *compt=[[NSDateComponents alloc]init];
    [compt setYear:q];
    [compt setDay:x];
    [compt setHour:y];
    [compt setMinute:z];
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    NSDate *date=[calendar dateByAddingComponents:compt toDate:startDate options:0];
    return date;

}


+(NSDate *)spaceTimeToDate:(NSDate *)startDate WithDay:(int)x Hour:(int)y Minute:(int)z
{
    NSDateComponents *compt=[[NSDateComponents alloc]init];
    [compt setDay:x];
    [compt setHour:y];
    [compt setMinute:z];
    NSCalendar *calendar=[NSCalendar currentCalendar];

    NSDate *date=[calendar dateByAddingComponents:compt toDate:startDate options:0];
    return date;
}

+(NSString *)getStringFromeDate:(NSDate *)date
{
    NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
    dateFor.dateFormat = @"yyyy-MM-dd";
    NSString *string=[dateFor stringFromDate:date];
    return string;
}


+(NSString *)getStringFromeDate:(NSDate *)date withFormatStr:(NSString *)FormatStr
{
    //1.将时间转化为字符串需要一个时间格式器
    NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
    
    //hh 代表12进制
    //HH 代表24进制
//    dateFor.dateFormat = @"yyyy年MM月dd日 HH:mm:ss";
    
    dateFor.dateFormat=FormatStr;
    NSString *string=[dateFor stringFromDate:date];
    return string;
}

+(int)backIntDayWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate{
    NSCalendar *mycalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlag = NSDayCalendarUnit;
    NSDateComponents *components = [mycalendar components:unitFlag fromDate:fromDate toDate:toDate options:0];
    int days = (int)[components day];
    return days;
}


+(NSDate *)getDateFromTimeStr:(NSString *)timeStr
{
    NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
    dateFor.dateFormat = @"yyyy-MM-dd";
    NSDate *date=[dateFor dateFromString:timeStr];
    return date;

}

+(NSDate *)getDateFromTimeStr:(NSString *)timeStr withFormatStr:(NSString *)FormatStr
{
    NSDateFormatter *dateFor = [[NSDateFormatter alloc] init];
    dateFor.dateFormat=FormatStr;
    NSDate *date=[dateFor dateFromString:timeStr];
    return date;
}

@end

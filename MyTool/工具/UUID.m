//
//  UUID.m
//  AFtest
//
//  Created by Xia_Q on 15/11/3.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import "UUID.h"
#import "KeychainItemWrapper.h"


@implementation UUID



+(NSString *)getUUID
{
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc]
                                         
                                         initWithIdentifier:@"UUID"
                                         
                                         accessGroup:@""];

    
    NSString *strUUID = [keychainItem objectForKey:(id)CFBridgingRelease(kSecValueData)];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""])
        
    {
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        [keychainItem setObject:strUUID forKey:(id)CFBridgingRelease(kSecValueData)];
        
    }
    
    NSString *DEVCID = [strUUID stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    return DEVCID;
}


@end

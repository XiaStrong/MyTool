//
//  XQGetData.m
//  bajieyuerBTeam
//
//  Created by Xia_Q on 16/2/17.
//  Copyright © 2016年 XiaQiang. All rights reserved.
//

#import "XQGetData.h"
#import "XQHud.h"
@implementation XQGetData

+(void)GetDataWithUrl:(NSString *)url object:(id)object parameters:(id)parameters success:(void(^)(id success))success fail:(void (^)())fail
{
    
//    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"application/xml", @"text/xml", @"text/plain" ,@"text/html",nil];
//    
//    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation * operation, id news) {
//        [XQHud hideAllHudsForView:object withText:@""];
//        success(news);
//    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
//        if (fail) {
//            fail();
//        }
//    }];

}

+ (void)POSTDataWithUrl:(NSString *)url object:(id)object parameters:(id)parameters success:(void (^)(id json))success fail:(void (^)())fail{
//    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"application/xml", @"text/xml", @"text/plain" ,@"text/html",nil];
//    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation * operation, id news) {
//        
//        success(news);
//        
//        
//    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
//        if (fail) {
//            fail();
//        }
//    }];
}

@end

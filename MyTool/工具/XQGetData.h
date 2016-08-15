//
//  XQGetData.h
//  bajieyuerBTeam
//
//  Created by Xia_Q on 16/2/17.
//  Copyright © 2016年 XiaQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AFNetworking.h"

@interface XQGetData : NSObject

/**
 *  GET 请求方法
 *
 *  @param url        Url地址
 *  @param object     需要添加提示框的 View
 *  @param parameters 参数
 *  @param success    成功后返回的Block
 *  @param fail       失败后返回的Block
 */

+(void)GetDataWithUrl:(NSString *)url object:(id)object parameters:(id)parameters success:(void(^)(id))success fail:(void (^)())fail;


/**
 *  POST 请求方法
 *
 *  @param url        Url地址
 *  @param object     需要添加提示框的 View
 *  @param parameters 参数,一般传字典
 *  @param success    成功后返回的Block
 *  @param fail       失败后返回的Block
 */
+ (void)POSTDataWithUrl:(NSString *)url object:(id)object parameters:(id)parameters success:(void (^)(id json))success fail:(void (^)())fail;

@end

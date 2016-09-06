//
//  HttpClient.h
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/29.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#define HTTPCLIENT [HttpClient sharedInstance]
typedef void(^successBlock)(id resultObj);
typedef void(^failureBlock)(NSError *error);

@interface HttpClient : NSObject
@property (nonatomic ,strong) NSString *requestType;//http or https,defult is http
@property (readwrite, nonatomic, strong) AFHTTPSessionManager *client;
/*
 * 实例化网络请求类
 */
+(instancetype)sharedInstance;

/*
 *  get 请求
 *  @param url URL
 *  @param params 参数dictionary
 *  @param success 成功回调
 *  @param failure 失败回调
 */
-(void)get:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

/*
 *  post 请求
 *  @param url URL
 *  @param params 参数dictionary
 *  @param success 成功回调
 *  @param failure 失败回调
 */
-(void)post:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure;

@end

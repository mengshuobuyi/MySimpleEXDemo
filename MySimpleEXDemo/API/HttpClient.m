//
//  HttpClient.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/29.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "HttpClient.h"

#define kTimeoutInterval 30

@interface HttpClient()
@property (nonatomic,strong) NSString *baseUrl;
@property (nonatomic,strong) AFHTTPSessionManager * http;

@end
@implementation HttpClient
#pragma mark - Public Method
+(instancetype)sharedInstance {
    static HttpClient *httpClient = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        httpClient = [[HttpClient alloc]init];
        httpClient.baseUrl = [[NSString alloc]init];
        httpClient.baseUrl = DE_BASE_URL;
     
    });
    return httpClient;
}

-(void)get:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure {
    NSURL *dataUrl = [NSURL URLWithString:url relativeToURL:[NSURL URLWithString:_baseUrl]];
    NSString *urlStr = [dataUrl absoluteString];
    [self.http GET:urlStr parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

-(void)post:(NSString *)url params:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure {
    NSURL *dataUrl = [NSURL URLWithString:url relativeToURL:[NSURL URLWithString:_baseUrl]];
    NSString *urlStr = [dataUrl absoluteString];
    [self.http POST:urlStr parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - URL Schema
-(NSString *)urlWithPath:(NSString *)path {
    if ([_requestType isEqualToString:@"https"]) {
        if ([self.baseUrl hasPrefix:@"http://"]) {
            self.baseUrl = [self.baseUrl stringByReplacingOccurrencesOfString:@"http://" withString:@"https://"];
        }
    }
    NSString* urlStr;
    urlStr = [NSString stringWithFormat:@"%@%@",self.baseUrl,path];
    return urlStr;
}
#pragma mark - Pravite Method
-(instancetype)init {
    self = [super init];
    if (self ) {
        return self;
    }
    return nil;
}


#pragma mark - Setter Getter

-(AFHTTPSessionManager *)http {
    if (!_http) {
        _http = [AFHTTPSessionManager manager];
        //上传格式设为json
        _http.requestSerializer = [AFJSONRequestSerializer serializer];
        //_http.requestSerializer = [AFHTTPRequestSerializer serializer];//上传普通格式
        
        //响应数据格式设为json
        _http.responseSerializer = [AFJSONResponseSerializer serializer];
//        _http.responseSerializer = [AFHTTPResponseSerializer serializer]; //AFN不会解析,数据是data，需要自己解析
        _http.requestSerializer.timeoutInterval = kTimeoutInterval;
        _http.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
   /*   设置manager的header 
        [_http.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [_http.requestSerializer setValue:[self getHelpToken] forHTTPHeaderField:@"Authorization"];
    */
    }
    return _http;
}


@end

//
//  HTTPManager.m
//  AFNetworking+ImageCache
//
//  Created by truestyle on 15/2/2.
//  Copyright (c) 2015年 truestyle. All rights reserved.
//

#import "HTTPManager.h"
#import "HTTPManagerDefine.h"

/**
 *  请求超时时间，默认30秒
 */
static NSTimeInterval timeoutInterval = 30.0f;

@implementation HTTPManager

static HTTPManager *instance = nil;

+ (HTTPManager *)sharedManager{
    
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        if(instance == nil)
            instance = [[HTTPManager alloc]init];
    });
    return instance;
}

- (id)init {
    return [self initWithBaseURL:[NSURL URLWithString:BASE_URL]];
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        
        //根据需求填写HTTP Header Field和Response的ContentTypes
        [self.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json",nil];
        
        //若使用https,取消注释这行代码
        //self.securityPolicy.allowInvalidCertificates = YES;
        
    }
    return self;
}

- (AFHTTPRequestOperation *)doHTTPGet:(HTTPReq *)req
                                start:(HttpConnectStartBlock)startBlock
                              success:(HttpConnectSuccessBlock)successBlock
                              failure:(HttpConnectFailureBlock)failureBlock
                               finish:(HttpConnectFinishBlock)finishBlock
{
    req.methodType = HttpMethodTypeGet;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:req.methodType
                                                                                 URLString:req.api
                                                                                parameters:req.params
                                                                                     error:nil];
    request.timeoutInterval = timeoutInterval;
    
    //NSLog(@"requestUrl:%@",request.URL);
    //[self setCookieToUrl:request.URL];
    AFHTTPRequestOperation *operation =
    [self HTTPRequestOperationWithRequest:request
     
                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                                    //NSLog(@"response:%@",responseObject);
                                                                          HTTPResp *resp = [[HTTPResp alloc]initWithResult:responseObject];
                                                                          resp.operation = operation;
                                      
                                      if (successBlock) {
                                                         successBlock(req,resp);
                                                        }
                                      
                                      if (finishBlock) {
                                                         finishBlock(req,YES);
                                                       }
                                  }
                                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                                          if (failureBlock) {
                                                                              failureBlock(req,error);
                                                                          }
                                                                          if (finishBlock) {
                                                                              finishBlock(req,NO);
                                                                          }
                                                                      }];
    [self.operationQueue addOperation:operation];
    if (startBlock) {
        startBlock(req);
    }
    return operation;
    
}

- (AFHTTPRequestOperation *)doHTTPPost:(HTTPReq *)req
                                 start:(HttpConnectStartBlock)startBlock
                               success:(HttpConnectSuccessBlock)successBlock
                               failure:(HttpConnectFailureBlock)failureBlock
                                finish:(HttpConnectFinishBlock)finishBlock
{
    req.methodType = HttpMethodTypePost;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:req.methodType
                                                                                 URLString:[NSString stringWithFormat:@"%@%@",self.baseURL,req.api]
                                                                                parameters:req.params
                                                                                     error:nil];
    request.timeoutInterval = timeoutInterval;
    //NSLog(@"requestUrl:%@",request.URL);
    //NSLog(@"params:%@",req.params);
    //[self setCookieToUrl:request.URL];
    AFHTTPRequestOperation *operation =
    [self HTTPRequestOperationWithRequest:request
     
                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                                          //NSLog(@"response:%@",responseObject);
                                                                          HTTPResp *resp = [[HTTPResp alloc]initWithResult:responseObject];
                                      
                                                       resp.operation = operation;
                                                       if (successBlock) {
                                                                              successBlock(req,resp);
                                                                          }
                                                       if (finishBlock) {
                                                                              finishBlock(req,YES);
                                                                          }
                                                                          
                                      }
                                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                        if (failureBlock) {
                                                                                  failureBlock(req,error);
                                                                        }
                                                        if (finishBlock) {
                                                                                  finishBlock(req,NO);
                                      }
                                      
                                                                      }];
    [self.operationQueue addOperation:operation];
    if (startBlock) {
        startBlock(req);
    }
    return operation;
}

- (void)cancelAllHTTPOperations {
    [self.operationQueue cancelAllOperations];
}

- (void)cancelHTTPOperationWithMethod:(NSString *)method path:(NSString *)path {
   
    for (NSOperation *operation in [self.operationQueue operations]) {
        if (![operation isKindOfClass:[AFHTTPRequestOperation class]]) {
            continue;
        }
        
        if ((!method || [method isEqualToString:[[(AFHTTPRequestOperation *)operation request] HTTPMethod]]) && [path isEqualToString:[[[(AFHTTPRequestOperation *)operation request] URL] path]]) {
            [operation cancel];
        }
    }
}


#pragma mark - Token Methods

#warning mark - TODO 由于用户TOKEN的写法灵活性较高，请根据后台需求向COOKIE或者参数中加入token


@end

//
//  HTTPManager.h
//  AFNetworking+ImageCache
//
//  Created by truestyle on 15/2/2.
//  Copyright (c) 2015年 truestyle. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "HTTPReq.h"
#import "HTTPResp.h"

typedef void (^HttpConnectStartBlock)(HTTPReq* req);
typedef void (^HttpConnectSuccessBlock)(HTTPReq* req, HTTPResp* resp);
typedef void (^HttpConnectFailureBlock)(HTTPReq* req, NSError* error);
typedef void (^HttpConnectFinishBlock)(HTTPReq* req, BOOL success);

@interface HTTPManager : AFHTTPRequestOperationManager

+ (HTTPManager *)sharedManager;

/**
 *  GET请求
 *
 *  @param req          详见HTTPReq
 *  @param startBlock   startBlock
 *  @param successBlock successBlock
 *  @param failureBlock failureBlock
 *  @param finishBlock  finishBlock
 *
 *  @return AFHTTPRequestOperation
 */
- (AFHTTPRequestOperation *)doHTTPGet:(HTTPReq *)req
                                start:(HttpConnectStartBlock)startBlock
                              success:(HttpConnectSuccessBlock)successBlock
                              failure:(HttpConnectFailureBlock)failureBlock
                               finish:(HttpConnectFinishBlock)finishBlock;
/**
 *  POST请求
 *
 *  @param req          详见HTTPReq
 *  @param startBlock   startBlock
 *  @param successBlock successBlock
 *  @param failureBlock failureBlock
 *  @param finishBlock  finishBlock
 *
 *  @return AFHTTPRequestOperation
 */
- (AFHTTPRequestOperation *)doHTTPPost:(HTTPReq *)req
                                 start:(HttpConnectStartBlock)startBlock
                               success:(HttpConnectSuccessBlock)successBlock
                               failure:(HttpConnectFailureBlock)failureBlock
                                finish:(HttpConnectFinishBlock)finishBlock;

/**
 *  取消所有请求
 */
- (void)cancelAllHTTPOperations;

/**
 *  取消某一请求
 *
 *  @param method method Name
 *  @param path   path Name
 */
- (void)cancelHTTPOperationWithMethod:(NSString *)method path:(NSString *)path;

@end

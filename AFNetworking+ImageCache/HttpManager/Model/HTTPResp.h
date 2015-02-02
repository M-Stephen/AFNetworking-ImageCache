//
//  HTTPResp.h
//  AFNetworking+ImageCache
//
//  Created by truestyle on 15/2/2.
//  Copyright (c) 2015年 truestyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPResult.h"
#import "AFHTTPRequestOperation.h"


@interface HTTPResp : NSObject

/**
 *  接口返回的状态码,需跟对应状态码字段进行绑定,默认是 DEFAULT_RESULT_CODE
 */
@property (nonatomic,assign) int resultCode;

/**
 *  接口返回的数据结果,使用方法查看 'HTTPResult'
 */
@property (nonatomic,strong) HTTPResult *result;

/**
 *  AFHTTPRequestOperation 通常用于出错时查看responseString等
 */
@property (nonatomic,strong) AFHTTPRequestOperation *operation;

/**
 *  根据operation的response的result进行初始化
 *
 *  @param result response的result，AFN中使用JSON通常为operation.responseObject
 *
 *  @return HTTPResp
 */
- (instancetype)initWithResult:(id)result;

/**
 *  是否出现服务器返回结果错误，由服务器定义的result Code决定，默认ERROR_CODE是-1
 *
 *  @return 是否错误
 */
- (BOOL)hasError;

@end

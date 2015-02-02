//
//  HTTPReq.h
//  AFNetworking+ImageCache
//
//  Created by truestyle on 15/2/2.
//  Copyright (c) 2015年 truestyle. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HttpMethodTypePost  @"POST"
#define HttpMethodTypeGet   @"GET"

typedef NSString* Api;
typedef NSString* HTTPMethodType;

@interface HTTPReq : NSObject

/**
 *  Api地址，实际应为Base URL对应的接口名
 */
@property (nonatomic,copy) Api api;
/**
 *  请求方式，默认是GET
 */
@property (nonatomic,copy) HTTPMethodType methodType;
/**
 *  需传递的参数
 */
@property (nonatomic, strong) NSMutableDictionary* params;

/**
 *  初始化Req
 *
 *  @param api 对应的Api
 *
 *  @return HTTPReq
 */
- (instancetype)initWithApi:(Api)api;

/**
 *  初始化Req
 *
 *  @param api    对应的Api
 *  @param params 所传参数
 *
 *  @return HTTPReq
 */
- (instancetype)initWithApi:(Api)api params:(NSDictionary*)params;

/**
 *  在已有的参数中添加参数(此函数为避免参数为nil的情况)
 *
 *  @param value value
 *  @param key   key
 */
- (void)addParam:(NSString*)value forKey:(NSString*)key;

@end

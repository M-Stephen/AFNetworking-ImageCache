//
//  HTTPReq.m
//  AFNetworking+ImageCache
//
//  Created by truestyle on 15/2/2.
//  Copyright (c) 2015年 truestyle. All rights reserved.
//

#import "HTTPReq.h"

@implementation HTTPReq

- (id)init{
    
    if(self = [super init]){
        _methodType = HttpMethodTypeGet;
        _api = @"";
        _params = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (instancetype)initWithApi:(Api)api {
    
    if(self = [self init]) {
        _api = api;
    }
    
    return self;
}

- (instancetype)initWithApi:(Api)api params:(NSDictionary *)params {
    
    self = [self initWithApi:api];
    _params = [NSMutableDictionary dictionaryWithDictionary:params];
    
    return self;
}

- (void)addParam:(NSString *)value forKey:(NSString *)key {
    if(value == nil || key == nil)
        return;
    if(self.params == nil)
        self.params = [NSMutableDictionary new];
    [self.params setObject:value forKey:key];
}

@end

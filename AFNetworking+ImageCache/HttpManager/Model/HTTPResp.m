//
//  HTTPResp.m
//  AFNetworking+ImageCache
//
//  Created by truestyle on 15/2/2.
//  Copyright (c) 2015年 truestyle. All rights reserved.
//

#import "HTTPResp.h"

#define DEFAULT_RESULT_CODE 1
#define ERROR_CODE         -1

@implementation HTTPResp

- (id)init{
    if(self = [super init]){
        _resultCode = DEFAULT_RESULT_CODE;
        _result = [[HTTPResult alloc]init];
    }
    return self;
}


- (instancetype)initWithResult:(id)result{
    if(self = [self init])
        [_result setValue:result];
    return self;
}

- (BOOL)hasError{
    return _resultCode == ERROR_CODE ? YES:NO;
}

@end

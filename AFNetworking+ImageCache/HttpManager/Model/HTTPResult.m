//
//  HTTPResult.m
//  AFNetworking+ImageCache
//
//  Created by truestyle on 15/2/2.
//  Copyright (c) 2015年 truestyle. All rights reserved.
//

#import "HTTPResult.h"

@interface HTTPResult()

/**
 *  返回的结果，只用来set，getter请使用value相关函数
 */
@property (nonatomic,strong) id value;

@end

@implementation HTTPResult

- (id)init{
    if(self = [super init]){
        
    }
    return self;
}

- (void)setValue:(id)value{
    _value = value;
}

- (NSDictionary *)dictionaryValue{
    if([_value isKindOfClass:[NSDictionary class]])
        return _value;
    else
        return nil;
}

- (NSArray *)arrayValue{
    if([_value isKindOfClass:[NSArray class]])
        return _value;
    else
        return nil;
}

- (NSString *)stringValue{
    if([_value isKindOfClass:[NSString class]])
        return _value;
    else
        return nil;
}



@end

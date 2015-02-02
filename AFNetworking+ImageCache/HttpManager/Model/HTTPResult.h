//
//  HTTPResult.h
//  AFNetworking+ImageCache
//
//  Created by truestyle on 15/2/2.
//  Copyright (c) 2015年 truestyle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPResult : NSObject

/**
 *  设置返回结果
 *
 *  @param value 返回的结果
 */
- (void)setValue:(id)value;

/**
 *  返回的dictionary数据，如果非dictionary数据，则返回nil
 *
 *  @return NSDictionary类型的数据
 */
- (NSDictionary *)dictionaryValue;

/**
 *  返回的array数据，如果非array数据，则返回nil
 *
 *  @return NSArray类型的数据
 */
- (NSArray *)arrayValue;

/**
 *  返回的string数据，如果非string数据，则返回nil
 *
 *  @return NSString类型的数据
 */
- (NSString *)stringValue;

@end

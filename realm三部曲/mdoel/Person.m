//
//  Person.m
//  realm三部曲
//
//  Created by vincentHK on 2017/12/17.
//  Copyright © 2017年 vincentHK. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (NSString *)primaryKey
{
    return @"id";
}


////忽略操作
//+ (NSArray<NSString *> *)ignoredProperties
//{
//    return @[@"name"];
//    
//    
//}
//
////非空操作
//+ (NSArray<NSString *> *)requiredProperties
//{
//    return @[@"name"];
//
//
//}
////默认值
//+(NSDictionary *)defaultPropertyValues{
//
//    return @{@"name":@"trump"};
//
//
//
//}




@end

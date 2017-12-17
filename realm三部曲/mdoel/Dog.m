//
//  Dog.m
//  realm三部曲
//
//  Created by vincentHK on 2017/12/17.
//  Copyright © 2017年 vincentHK. All rights reserved.
//

#import "Dog.h"
#import "Person.h"

@implementation Dog
+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"owners": [RLMPropertyDescriptor descriptorWithClass:Person.class propertyName:@"dogs"],
             };
}
@end

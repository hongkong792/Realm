//
//  Person.h
//  realm三部曲
//
//  Created by vincentHK on 2017/12/17.
//  Copyright © 2017年 vincentHK. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

@interface Person : RLMObject

@property long id;
@property NSString* name;
@property RLMArray<Dog> *dogs;
@end
RLM_ARRAY_TYPE(Person)


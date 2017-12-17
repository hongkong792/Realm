//
//  Dog.h
//  realm三部曲
//
//  Created by vincentHK on 2017/12/17.
//  Copyright © 2017年 vincentHK. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject

@property NSString* name;
@property (readonly) RLMLinkingObjects *owners;


@end
RLM_ARRAY_TYPE(Dog)






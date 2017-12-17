//
//  ViewController.m
//  realm三部曲
//
//  Created by vincentHK on 2017/12/17.
//  Copyright © 2017年 vincentHK. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "Person.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   // [self insertObjects:103];

   // [self realDelete];
  //  [self update];
    [self findOwners];


}

#pragma mark 增加
- (void)insertObjects:(NSInteger)ID
{
    Person * person = [Person new];
    person.name = @"海阔天空";
    person.id = ID;
    
    Dog * dog1 = [Dog new];
    dog1.name = @"dog11111";
    
    [person.dogs addObject:dog1];
    
    NSLog(@"Person:%@",person);
    RLMRealm * realm = [RLMRealm defaultRealm];
    //事物操作
    [realm beginWriteTransaction];
    [realm addOrUpdateObject:person];
    [realm commitWriteTransaction];
    
    
}


#pragma mark 删除
- (void)realDelete
{
    
    
   RLMResults * rls=  [self select];
     Person *person  =   [rls firstObject];
    
    
    RLMRealm * realm = [RLMRealm defaultRealm];
    //事物操作
    [realm beginWriteTransaction];
    [realm deleteObject:person];

    [realm commitWriteTransaction];
    
    
    
    
}


#pragma mark 查询
- (RLMResults *)select
{
    
    return  [Person objectsWhere:@"id = %ld",101];
    
    
}

#pragma mark 修改
- (void)update
{
    RLMResults * rls=  [self select];
    Person *person  =   [rls firstObject];
    
    
    RLMRealm * realm = [RLMRealm defaultRealm];
    //事物操作
    [realm beginWriteTransaction];

    
    
    person.name = @"vr";
    for (Dog * dog in person.dogs) {
        if ([dog.name isEqualToString:@"dog11111"]) {
            dog.name = @" kim";
        }
        
    }
    
    
    [realm commitWriteTransaction];
    
    
}

#pragma mark反向查询
- (void)findOwners
{
    RLMResults *rls =  [Dog objectsWhere:@"name = ' kim'"];
    Dog *dog = [rls lastObject];
    NSLog(@"DogOwner:%@",dog.owners);
    
}


























@end

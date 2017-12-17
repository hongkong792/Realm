//
//  AppDelegate.m
//  realm三部曲
//
//  Created by vincentHK on 2017/12/17.
//  Copyright © 2017年 vincentHK. All rights reserved.
//

#import "AppDelegate.h"
#import <Realm.h>
#import "Person.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 使用默认的目录，但是使用用户名来替换默认的文件名
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent]  URLByAppendingPathComponent:@"realmTest"] URLByAppendingPathExtension:@"realm"];
    
    
    
    
    // 将这个配置应用到默认的 Realm 数据库当中
    config.schemaVersion = 1;
    config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion) {
        // 目前我们还未进行数据迁移，因此 oldSchemaVersion == 0
        if (oldSchemaVersion < 1) {
            //    enumerateObjects:block: 方法遍历了存储在 Realm 文件中的每一个“Person”对象
            [migration enumerateObjects:Person.className
                                  block:^(RLMObject *oldObject, RLMObject *newObject) {
                                      
                                      // 将名字进行合并，存放在 fullName 域中
                                      newObject[@"id"] = @(-1);
                                      
                                      
                                  }];
        }
        
        
        
        
         
        
    };
    
    
    [RLMRealmConfiguration setDefaultConfiguration:config];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

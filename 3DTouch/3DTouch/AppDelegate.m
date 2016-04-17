//
//  AppDelegate.m
//  3DTouch
//
//  Created by 弓虽_子 on 15/12/26.
//  Copyright © 2015年 弓虽_子. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //设置图标长按时,弹出的样式.
    
    //iconWithType:图标的类型
    UIApplicationShortcutIcon *icon0 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    UIApplicationShortcutItem *item0 = [[UIApplicationShortcutItem alloc] initWithType:@"tpye0"
                                                                        localizedTitle:@"标题"
                                                                     localizedSubtitle:@"我是子标题"
                                                                                  icon:icon0
                                                                              userInfo:@{@"info": @"我是要传入的信息"}];
    
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"tpye0"
                                                                        localizedTitle:@"标题2"
                                                                     localizedSubtitle:@"我是子标题"
                                                                                  icon:icon0
                                                                              userInfo:@{@"info": @"我是要传入的信息"}];
    application.shortcutItems = @[item0,item1];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler
{
   
    if ([shortcutItem.type isEqualToString:@"tpye0"]) {
        NSLog(@"%@",shortcutItem.userInfo[@"info"]);
    } else {
        NSLog(@"asdf");
    }
}





@end

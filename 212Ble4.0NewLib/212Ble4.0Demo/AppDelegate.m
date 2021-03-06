//
//  AppDelegate.m
//  212Ble4.0Demo
//
//  Created by 梁科 on 14-12-11.
//  Copyright (c) 2014年 castel. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#include "Obd3Prtl_Lib.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [self test]; //测试初始化接口
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    RootViewController *rootVC=[[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
 
    
    UINavigationController *rootNAV=[[UINavigationController alloc]initWithRootViewController:rootVC];
    [rootNAV setNavigationBarHidden:YES animated:NO];
    
    self.window.rootViewController = rootNAV;
    [self.window makeKeyAndVisible];
    return YES;
}


// 测试初始化接口
- (void)test {
    
    
//    dataNUM = @"0xffffffff"; --> dataNUM = @"4294967295";
    
//      dataNUM = @"0xffffff"; --> dataNUM = @"16777215";
    
    
    const char *device_ID = [@"212BM1144101306" UTF8String];
    
    const char *device_dataNum = [@"4294967295" UTF8String];
    
//    const char *device_dataNum = [@"100" UTF8String];
    
//    const char *device_ID = [@"" UTF8String];
    
//    const char *device_dataNum = [@"" UTF8String];
    
    
    
    int result = init((char *)device_ID,(char *)device_dataNum);
    
    
    if (result == -1) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: NSLocalizedString(@"提示" , nil) message:NSLocalizedString(@"初始化失败", nil)  delegate:self cancelButtonTitle: NSLocalizedString( @"确定", nil) otherButtonTitles: nil];
        [alert show];
    }
    else if (result == 0){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: NSLocalizedString(@"提示" , nil) message:NSLocalizedString(@"初始化成功", nil)  delegate:self cancelButtonTitle: NSLocalizedString( @"确定", nil) otherButtonTitles: nil];
        [alert show];
    }
    
    
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

@end

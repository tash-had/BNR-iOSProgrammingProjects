//
//  AppDelegate.m
//  HypnoNerd
//
//  Created by Tash-had Saqif on 2017-09-05.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "BNRReminderViewController.h"
#import "QuizViewController.h"

@import UserNotifications;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Init HypnosisViewController
    ViewController *hvc = [[ViewController alloc] init];
    
    // Get a pointer to an object that represents the app bundle
//    NSBundle *appBundle = [NSBundle mainBundle];
    // Look in the appbundle for the BNRReminderViewController.xib
//    BNRReminderViewController *rvc = [[BNRReminderViewController alloc] initWithNibName:@"BNRReminderViewController" bundle:appBundle];
    
    // When you init without nibNamem like above, then the compiler will automatically just search for the xib file using the name of the view controller. SO it'll look for BNRReminderViewController.xib
    BNRReminderViewController *rvc = [[BNRReminderViewController alloc] init];

//    self.window.rootViewController = rvc;
    
    // Create view controller for Quiz view
    QuizViewController *qvc = [[QuizViewController alloc] init];
    
    // Create a TabBarController, and give it the two viewcontrollers, then set it as the rootview
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[hvc, rvc, qvc];
    self.window.rootViewController = tabBarController;
    

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

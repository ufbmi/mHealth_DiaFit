//
//  AppDelegate.m
//  DiaFit
//
//  Created by Reynaldo Olivo on 1/20/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "NutritionViewController.h"
#import "GlucoseViewController.h"
#import "ProfileViewController.h"
#import "PhysicalViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Home controller
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    homeVC.tabBarItem.title = @"Home";
    //Physical controller
    PhysicalViewController *physicalVC = [[PhysicalViewController alloc]init];
    physicalVC.tabBarItem.title = @"Physical";
    //Nutrition controller
    NutritionViewController *nutritionVC = [[NutritionViewController alloc]init];
    nutritionVC.tabBarItem.title = @"Nutrition";
    //Glucose controller
    GlucoseViewController *glucoseVC = [[GlucoseViewController alloc]init];
    glucoseVC.tabBarItem.title = @"Glucose";
    //Profile controller
    ProfileViewController *profileVC = [[ProfileViewController alloc]init];
    profileVC.tabBarItem.title = @"Profile";
    
    //init the UITabBarController
    
    self.tabBarController = [[UITabBarController alloc]init];
    self.tabBarController.viewControllers = @[homeVC,physicalVC,nutritionVC,glucoseVC,profileVC];
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

@end

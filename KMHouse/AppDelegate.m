//
//  AppDelegate.m
//  KMHouse
//
//  Created by thinker on 16/4/25.
//  Copyright © 2016年 Trefoil. All rights reserved.
//

#import "AppDelegate.h"
#import "XTSideMenu.h"
#import "Utility.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
XTSideMenu *root;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *center = [board instantiateViewControllerWithIdentifier:@"mainContent"];
    UIViewController *left = [board instantiateViewControllerWithIdentifier:@"leftMenu"];
    UIViewController *right = [board instantiateViewControllerWithIdentifier:@"rightMenu"];
    
    root = [[XTSideMenu alloc] initWithContentViewController:center leftMenuViewController:left rightMenuViewController:right];
    UINavigationItem *nav =  root.navigationItem;
    nav.title = @"成长营";
    nav.leftBarButtonItem = BARBUTTON(@"左边", leftButtonClick:);
    nav.rightBarButtonItem = BARBUTTON(@"右边", rightButtonClick:);
   // [root.navigationController.navigationBar
    root.edgesForExtendedLayout = UIRectEdgeNone;
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:root];
    
    
    [self.window makeKeyAndVisible];
    
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
 
    return YES;
}
-(void)leftButtonClick:(UIBarButtonItem *)button{
    if(root.visible == XTSideMenuVisibleTypeContent){
       [root presentLeftViewController];
    }else if(root.visible == XTSideMenuVisibleTypeLeft){
        [root hideMenuViewController];
    }
}
-(void)rightButtonClick:(UIBarButtonItem *)button{
    if(root.visible == XTSideMenuVisibleTypeContent){
       [root presentRightViewController];
    }else if(root.visible == XTSideMenuVisibleTypeRight){
        [root hideMenuViewController];
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

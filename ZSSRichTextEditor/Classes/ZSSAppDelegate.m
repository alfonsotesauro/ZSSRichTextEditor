//
//  ZSSAppDelegate.m
//  ZSSRichTextEditor
//
//  Created by Nicholas Hubbard on 11/28/13.
//  Copyright (c) 2013 Zed Said Studio. All rights reserved.
//

#import "ZSSAppDelegate.h"

@implementation ZSSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.mainViewController = [[ZSSDemoList alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.mainViewController];
    nav.navigationBar.translucent = NO;
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSURL *ubiquitousURL = [[[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil] URLByAppendingPathComponent:@"My iCloud Drive Test"];
    
    NSString *imageName = [defaults valueForKey:@"lastChosenImageURL"];
    if (imageName != nil) {
    NSURL *preciseURL = [ubiquitousURL URLByAppendingPathComponent:imageName];
    
    UIImage *image = [UIImage imageWithContentsOfFile:[preciseURL path]];
    NSLog(@"Eccoci");
    [UIImagePNGRepresentation(image) writeToFile:@"/Users/fofo/Desktop/bello.png" atomically:YES];
        
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

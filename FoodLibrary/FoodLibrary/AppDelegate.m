//
//  AppDelegate.m
//  FoodLibrary
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 zhiyou.com. All rights reserved.
//

#import "AppDelegate.h"
#import "GoEatViewController.h"
#import "ZYFoodHomeViewController.h"
#import "MeViewController.h"
#import "ZYGuiDeViewController.h"

@interface AppDelegate ()<ZYGuiDeViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
    
    BOOL isGuiDe = [ud boolForKey:@"guide"];
    
    if (isGuiDe) {
        
         [self createTabbar];
    }else
    {
       ZYGuiDeViewController *guide = [[ZYGuiDeViewController alloc] init];
        
        guide.delegate = self;
        
        _window.rootViewController = guide;
        
    }
    
    
    [self.window makeKeyAndVisible];
   
    
    return YES;
}

- (void)goMain
{
    [self createTabbar];
}

- (void)createTabbar
{
    UITabBarController * tabbar=[[UITabBarController alloc] init];
    GoEatViewController * goEatVC=[[GoEatViewController alloc] init];
    UINavigationController * goEatnav=[[UINavigationController alloc] initWithRootViewController:goEatVC];
    goEatVC.navigationItem.title=@"食物派";
    goEatnav.tabBarItem.title=@"逛吃";
    goEatnav.tabBarItem.image = [UIImage imageNamed:@"ic_tab_homepage"];
    goEatnav.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_tab_homepage_select"];
    
    ZYFoodHomeViewController * foodVC=[[ZYFoodHomeViewController alloc] init];
    UINavigationController * foodnav=[[UINavigationController alloc] initWithRootViewController:foodVC];
    foodnav.tabBarItem.image = [UIImage imageNamed:@"ic_tab_search"];
    foodnav.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_tab_search_select"];
    
    foodnav.tabBarItem.title=@"食物百科";
    MeViewController * meVC=[[MeViewController alloc] init];
     UINavigationController * menav=[[UINavigationController alloc] initWithRootViewController:meVC];
    
    menav.tabBarItem.image = [UIImage imageNamed:@"ic_tab_my"];
    menav.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_tab_my_select"];

    
    menav.title=@"我的";
    tabbar.tabBar.tintColor = [UIColor redColor];
    
    tabbar.viewControllers=@[goEatnav,foodnav,menav];
    
    _window.rootViewController=tabbar;
    
}

@end

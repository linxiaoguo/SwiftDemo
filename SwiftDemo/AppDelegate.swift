//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by 林小果 on 15/12/29.
//  Copyright © 2015年 林小果. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        
        let vc1 = MainViewCtr()
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.tabBarItem.image = UIImage(named: "n1")
        nav1.tabBarItem.selectedImage = UIImage(named: "n1_h")
        nav1.title = "首页"
        
        let vc2 = StockListViewCtr()
        let nav2 = UINavigationController(rootViewController: vc2)
        nav2.tabBarItem.image = UIImage(named: "n2")
        nav2.tabBarItem.selectedImage = UIImage(named: "n2_h")
        nav2.title = "股票列表"
        
        let vc3 = MineViewCtr()
        let nav3 = UINavigationController(rootViewController: vc3)
        nav3.tabBarItem.image = UIImage(named: "n3")
        nav3.tabBarItem.selectedImage = UIImage(named: "n3_h")
        nav3.title = "我的"
        
        let tabBar = UITabBarController()
        let array = [nav1, nav2, nav3]
        tabBar.viewControllers = array
        
        appearance()
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func appearance() {
        //导航栏背景
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "tabbarBg"), forBarMetrics: .Default)
        
        //导航栏字体颜色
        let attrs = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Georgia-Bold", size: 20)!
        ]
        UINavigationBar.appearance().titleTextAttributes = attrs
    }
}


//
//  AppDelegate.swift
//  TLTabBarSpring
//
//  Created by Andrew on 05/27/2016.
//  Copyright (c) 2016 Andrew. All rights reserved.
//

import UIKit
import TLTabBarSpring

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
      
        manualCreateTabBar()
        return true
    }
    
    /**
     动画创建TabBarController
     */
    func manualCreateTabBar() -> Void {
        //1.创建Window
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        
        let vc1=CustomController1()
        vc1.tabBarItem = TLTabBarSpringItem()
        (vc1.tabBarItem as! TLTabBarSpringItem).animation=TLBoundAnimation()
        vc1.tabBarItem.title="首页"
        vc1.tabBarItem.image=UIImage(named: "icon_user")
        initStyle(vc1.tabBarItem)
        
        let vc2=CustomController2()
        vc2.tabBarItem = TLTabBarSpringItem()
         (vc2.tabBarItem as! TLTabBarSpringItem).animation=TLBoundAnimation()
        vc2.tabBarItem.title="发现"
        vc2.tabBarItem.image=UIImage(named: "icon_pin")
        initStyle(vc2.tabBarItem)
        
        let vc3=CustomController3()
        vc3.tabBarItem = TLTabBarSpringItem()
        (vc3.tabBarItem as! TLTabBarSpringItem).animation=TLBoundAnimation()
        vc3.tabBarItem.title="消息"
        vc3.tabBarItem.image=UIImage(named: "Tools_00028")
         initStyle(vc3.tabBarItem)
        
        let vc4=CustomController4()
        vc4.tabBarItem = TLTabBarSpringItem()
        (vc4.tabBarItem as! TLTabBarSpringItem).animation=TLBoundAnimation()
        vc4.tabBarItem.title="我的"
        vc4.tabBarItem.image=UIImage(named: "drop")
        initStyle(vc4.tabBarItem)
        
        
        
        let tabVc = TLTabBarSpringController(viewControllers: [vc1,vc2,vc3,vc4])

        
        //tabVc.setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        tabVc.view.backgroundColor=UIColor.whiteColor()
        
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.rootViewController=tabVc
        self.window?.makeKeyAndVisible()
    }
    func initStyle(tabBarItem:UITabBarItem) -> Void {
        let tabBarSpringItem:TLTabBarSpringItem = tabBarItem as! TLTabBarSpringItem
        
        tabBarSpringItem.textColor = UIColor.grayColor()
        tabBarSpringItem.iconColor = UIColor.grayColor()
        
        tabBarSpringItem.animation.textSelctedColor=UIColor.redColor()
        tabBarSpringItem.animation.iconSelectedColor=UIColor.redColor()
        
    }


}

extension UIColor{
    
    public func randomColor() -> UIColor{
        
        let r:CGFloat = CGFloat(arc4random() % 255);
        let g:CGFloat = CGFloat(arc4random() % 255);
        let b:CGFloat = CGFloat(arc4random() % 255);
        
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
}



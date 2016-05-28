//
//  SecondController.swift
//  TLTabBarSpring
//
//  Created by Andrew on 16/5/28.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import TLTabBarSpring

class SecondController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.tabBarItem != nil){
            print(self.tabBarItem)
            let springTabBarItem:TLTabBarSpringItem = self.tabBarItem as! TLTabBarSpringItem;
            springTabBarItem.animation = TLBoundAnimation()
            springTabBarItem.playAnimation()
            
        }
    }
}

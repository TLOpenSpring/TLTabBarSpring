//
//  FirstController.swift
//  TLTabBarSpring
//
//  Created by Andrew on 16/5/28.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import TLTabBarSpring

class FirstController: UIViewController {
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if(self.tabBarItem != nil){
            print(self.tabBarItem)
            let springTabBarItem:TLTabBarSpringItem = self.tabBarItem as! TLTabBarSpringItem;
            springTabBarItem.animation = TLBoundAnimation()
            springTabBarItem.playAnimation()
            
        }
    }
}

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
    
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        
//        initStyle()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //self.title="SecondController"
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        initStyle()
        initView()
    }
    
    
    func initStyle() -> Void {
        let tabBarSpringItem:TLTabBarSpringItem = self.tabBarItem as! TLTabBarSpringItem
        
        tabBarSpringItem.textColor = UIColor.grayColor()
        tabBarSpringItem.iconColor = UIColor.grayColor()
        
        tabBarSpringItem.animation.textSelctedColor=UIColor.redColor()
        tabBarSpringItem.animation.iconSelectedColor=UIColor.redColor()
    }
    
    func initView() -> Void {
        
        let rect =  CGRectMake(100, 100,200, 100);
        let btn=UIButton(frame: rect)
        btn.center=self.view.center
        btn.setTitle("SecondController", forState: .Normal)
        btn.setTitleColor(UIColor.redColor(), forState: .Normal)
        self.view.addSubview(btn)
    }
}

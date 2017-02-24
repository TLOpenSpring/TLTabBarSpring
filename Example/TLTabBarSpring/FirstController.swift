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
    
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        initStyle()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initStyle()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title="FirstController";
        self.view.backgroundColor = UIColor.groupTableViewBackground
        
        self.tabBarController?.tabBar.tintColor = UIColor.red
        
       
        initStyle()
        
        initView()
    }
    
    func initStyle() -> Void {
        let tabBarSpringItem:TLTabBarSpringItem = self.tabBarItem as! TLTabBarSpringItem
        
        tabBarSpringItem.textColor = UIColor.gray
        tabBarSpringItem.iconColor = UIColor.gray
        
        tabBarSpringItem.animation.textSelctedColor=UIColor.red
        tabBarSpringItem.animation.iconSelectedColor=UIColor.red
        
        
    }
    
    func initView() -> Void {
        
        let rect =  CGRect(x: 100, y: 100,width: 200, height: 100);
        let btn=UIButton(frame: rect)
        btn.center=self.view.center
        btn.setTitle("FirstController", for: UIControlState())
        btn.setTitleColor(UIColor.red, for: UIControlState())
        self.view.addSubview(btn)
    }
    

}

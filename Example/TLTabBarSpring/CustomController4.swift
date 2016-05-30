//
//  CustomController4.swift
//  TLTabBarSpring
//
//  Created by Andrew on 16/5/30.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit

class CustomController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        initView()
    }
    
    func initView() -> Void {
        
        let rect = CGRectMake(100, 100, 200, 40)
        
        let btn = UIButton(frame: rect)
        btn.center=self.view.center
        btn.setTitle("我的页面", forState: .Normal)
        btn.setTitleColor(UIColor.redColor(), forState: .Normal)
        btn.titleLabel?.font=UIFont.boldSystemFontOfSize(28)
        self.view.addSubview(btn)
    }
}

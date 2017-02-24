//
//  CustomController3.swift
//  TLTabBarSpring
//
//  Created by Andrew on 16/5/30.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit

class CustomController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        initView()
    }
    
    func initView() -> Void {
        
        let rect = CGRect(x: 100, y: 100, width: 200, height: 40)
        
        let btn = UIButton(frame: rect)
        btn.center=self.view.center
        btn.setTitle("消息页面", for: UIControlState())
        btn.setTitleColor(UIColor.red, for: UIControlState())
        btn.titleLabel?.font=UIFont.boldSystemFont(ofSize: 28)
        self.view.addSubview(btn)
    }
}

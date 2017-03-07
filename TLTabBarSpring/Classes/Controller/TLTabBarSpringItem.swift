//
//  TLTabBarSpringItem.swift
//  Pods
//
//  Created by Andrew on 16/5/28.
//
//

import UIKit

open class TLTabBarSpringItem: UITabBarItem {
    //声明动画基类
    @IBOutlet open var animation:TLBaseAnimation!
    
    open var iconView:(icon:UIImageView , textLb:UILabel)?
    
    
     open var defaultFont:UIFont = UIFont.systemFont(ofSize: 12)
    
     open var textColor: UIColor = UIColor.clear
     open var iconColor: UIColor = UIColor.clear // if alpha color is 0 color ignoring
    
    open var DefaultBackgroundColor:UIColor = UIColor.clear
    open var selectBackgroundColor:UIColor = UIColor.clear

    open func playAnimation(){
        assert(animation != nil,"必须在UitabBarItem中添加一个animation")
        guard animation != nil && iconView != nil else {
           return
        }
        
        //开始动画
        animation.startAnimation(iconView!.icon, textLb: iconView!.textLb)
    
    }
    
    
    open func deSelectAnimation() -> Void {
        guard animation != nil && iconView != nil else{
         return
        }
        animation.deSelectAnimation(
            iconView!.icon,
            textLb: iconView!.textLb,
            defaultTextColor: textColor,
            defaultIconColor: iconColor)
        
    }
    
    open func selectedState() -> Void {
        guard animation != nil && iconView != nil else{
            return
        }
        
        animation.selectState(iconView!.icon, textLb: iconView!.textLb)
    }
    
}

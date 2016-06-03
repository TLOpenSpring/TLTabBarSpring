//
//  TLTabBarSpringItem.swift
//  Pods
//
//  Created by Andrew on 16/5/28.
//
//

import UIKit

public class TLTabBarSpringItem: UITabBarItem {
    //声明动画基类
    @IBOutlet public var animation:TLBaseAnimation!
    
    public var iconView:(icon:UIImageView , textLb:UILabel)?
    
    
     public var defaultFont:UIFont = UIFont.systemFontOfSize(12)
    
     public var textColor: UIColor = UIColor.clearColor()
     public var iconColor: UIColor = UIColor.clearColor() // if alpha color is 0 color ignoring
    
    public var DefaultBackgroundColor:UIColor = UIColor.clearColor()
    public var selectBackgroundColor:UIColor = UIColor.clearColor()

    public func playAnimation(){
        assert(animation != nil,"必须在UitabBarItem中添加一个animation")
        guard animation != nil && iconView != nil else {
           return
        }
        
        //开始动画
        animation.startAnimation(iconView!.icon, textLb: iconView!.textLb)
    
    }
    
    
    public func deSelectAnimation() -> Void {
        guard animation != nil && iconView != nil else{
         return
        }
        animation.deSelectAnimation(
            iconView!.icon,
            textLb: iconView!.textLb,
            defaultTextColor: textColor,
            defaultIconColor: iconColor)
        
    }
    
    public func selectedState() -> Void {
        guard animation != nil && iconView != nil else{
            return
        }
        
        animation.selectState(iconView!.icon, textLb: iconView!.textLb)
    }
    
}

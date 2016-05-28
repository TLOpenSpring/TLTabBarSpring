//
//  TLBoundAnimation.swift
//  Pods
//
//  Created by Andrew on 16/5/28.
//
//

import UIKit

public class TLBoundAnimation: TLBaseAnimation {

    override public func startAnimation(icon:UIImageView,textLb:UILabel) -> Void{
        tl_bounceAnimation(icon)
        textLb.textColor = textSelctedColor
    }
    
    override public func deSelectAnimation(icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                         defaultIconColor:UIColor) -> Void{
        
        textLb.textColor = defaultIconColor;
        if let iconImg = icon.image {
            let renderMode = CGColorGetAlpha(defaultIconColor.CGColor) == 0 ? UIImageRenderingMode.AlwaysOriginal :
                UIImageRenderingMode.AlwaysTemplate
            
            let renderImage = iconImg.imageWithRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
    
    }
    
    override public func selectState(icon:UIImageView,textLb:UILabel) -> Void{
    //设置文本的颜色
        textLb.textColor = textSelctedColor
        if let iconImg = icon.image{
         let renderImage = iconImg.imageWithRenderingMode(.AlwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
    
    
    func tl_bounceAnimation(icon:UIImageView) -> Void {
        let bounceAnimation = CAKeyframeAnimation(keyPath: AnimationKeys.Scale)
        
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = NSTimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.addAnimation(bounceAnimation, forKey: "TLBounce")
        
        if let iconImg = icon.image {
            let renderImg = iconImg.imageWithRenderingMode(.AlwaysTemplate)
            icon.image = renderImg
            icon.tintColor = iconSelectedColor
        }
    }
}








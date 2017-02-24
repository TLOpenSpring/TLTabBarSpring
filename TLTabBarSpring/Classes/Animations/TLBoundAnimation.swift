//
//  TLBoundAnimation.swift
//  Pods
//
//  Created by Andrew on 16/5/28.
//
//

import UIKit

open class TLBoundAnimation: TLBaseAnimation {

    override open func startAnimation(_ icon:UIImageView,textLb:UILabel) -> Void{
        tl_bounceAnimation(icon)
        textLb.textColor = textSelctedColor
    }
    
    override open func deSelectAnimation(_ icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                         defaultIconColor:UIColor) -> Void{
        
        textLb.textColor = defaultIconColor;
        if let iconImg = icon.image {
            let renderMode = defaultIconColor.cgColor.alpha == 0 ? UIImageRenderingMode.alwaysOriginal :
                UIImageRenderingMode.alwaysTemplate
            
            let renderImage = iconImg.withRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
    
    }
    
    override open func selectState(_ icon:UIImageView,textLb:UILabel) -> Void{
    //设置文本的颜色
        textLb.textColor = textSelctedColor
        if let iconImg = icon.image{
         let renderImage = iconImg.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
    
    
    func tl_bounceAnimation(_ icon:UIImageView) -> Void {
        let bounceAnimation = CAKeyframeAnimation(keyPath: AnimationKeys.Scale)
        
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.add(bounceAnimation, forKey: "TLBounce")
        
        if let iconImg = icon.image {
            let renderImg = iconImg.withRenderingMode(.alwaysTemplate)
            icon.image = renderImg
            icon.tintColor = iconSelectedColor
        }
    }
}








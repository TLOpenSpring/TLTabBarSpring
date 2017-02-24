//
//  TLRotationAnimation.swift
//  Pods
//
//  Created by Andrew on 16/5/30.
//
//

import UIKit

public enum TLRotationDirection {
    case left
    case right
}

open class TLRotationAnimation: TLBaseAnimation {
    
    
   public override init() {
        super.init()
        direcation = .left
    }
    
    open var direcation : TLRotationDirection!
    
    
    
    open override func startAnimation(_ icon:UIImageView,textLb:UILabel) -> Void{
        playRotationAnimation(icon)
        textLb.textColor=textSelctedColor
    }
    
    open override func deSelectAnimation(_ icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                                  defaultIconColor:UIColor) -> Void{
        
        if let iconImg = icon.image {
            let renderMode = defaultIconColor.cgColor.alpha == 0 ? UIImageRenderingMode.alwaysOriginal : UIImageRenderingMode.alwaysTemplate
            
            let renderImage = iconImg.withRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
        
        textLb.textColor = defaultTextColor
    }
    
    open override func selectState(_ icon:UIImageView,textLb:UILabel) -> Void{
        
    }
    
    func playRotationAnimation(_ icon:UIImageView) -> Void {
        let rotationAnimation = CABasicAnimation(keyPath: AnimationKeys.Rotation)
        rotationAnimation.fromValue = 0.0
        
        
        var toValue = CGFloat(M_PI * 2)
        if direcation != nil && direcation == TLRotationDirection.left {
          toValue = toValue * -1
        }
        
        rotationAnimation.toValue = toValue
        rotationAnimation.duration = TimeInterval(duration)
        icon.layer.add(rotationAnimation, forKey: "TLRotation")
        
        if let iconImg = icon.image {
         let renderImage = iconImg.withRenderingMode(.alwaysTemplate)
            icon.image=renderImage
            icon.tintColor = iconSelectedColor
        }
        
     }
}










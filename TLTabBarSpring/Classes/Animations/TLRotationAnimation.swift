//
//  TLRotationAnimation.swift
//  Pods
//
//  Created by Andrew on 16/5/30.
//
//

import UIKit

public enum TLRotationDirection {
    case Left
    case Right
}

public class TLRotationAnimation: TLBaseAnimation {
    
    
   public override init() {
        super.init()
        direcation = .Left
    }
    
    public var direcation : TLRotationDirection!
    
    
    
    public override func startAnimation(icon:UIImageView,textLb:UILabel) -> Void{
        playRotationAnimation(icon)
        textLb.textColor=textSelctedColor
    }
    
    public override func deSelectAnimation(icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                                  defaultIconColor:UIColor) -> Void{
        
        if let iconImg = icon.image {
            let renderMode = CGColorGetAlpha(defaultIconColor.CGColor) == 0 ? UIImageRenderingMode.AlwaysOriginal : UIImageRenderingMode.AlwaysTemplate
            
            let renderImage = iconImg.imageWithRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
        
        textLb.textColor = defaultTextColor
    }
    
    public override func selectState(icon:UIImageView,textLb:UILabel) -> Void{
        
    }
    
    func playRotationAnimation(icon:UIImageView) -> Void {
        let rotationAnimation = CABasicAnimation(keyPath: AnimationKeys.Rotation)
        rotationAnimation.fromValue = 0.0
        
        
        var toValue = CGFloat(M_PI * 2)
        if direcation != nil && direcation == TLRotationDirection.Left {
          toValue = toValue * -1
        }
        
        rotationAnimation.toValue = toValue
        rotationAnimation.duration = NSTimeInterval(duration)
        icon.layer.addAnimation(rotationAnimation, forKey: "TLRotation")
        
        if let iconImg = icon.image {
         let renderImage = iconImg.imageWithRenderingMode(.AlwaysTemplate)
            icon.image=renderImage
            icon.tintColor = iconSelectedColor
        }
        
     }
}










//
//  TLTransitionAnimation.swift
//  Pods
//
//  Created by Andrew on 16/5/30.
//
//

import UIKit

open class TLTransitionAnimation: TLBaseAnimation {

    open var transitionOptions : UIViewAnimationOptions!
    
    
  public override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions()
    }
    
  public  init(transition:UIViewAnimationOptions) {
      super.init()
     transitionOptions = transition
    }
    
    open override func startAnimation(_ icon:UIImageView,textLb:UILabel) -> Void{
        selectedColor(icon, textLb: textLb)
        
        UIView.transition(with: icon, duration: TimeInterval(duration), options: transitionOptions, animations: {
            
            }, completion: nil)
    }
    
    open override func deSelectAnimation(_ icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                                  defaultIconColor:UIColor) -> Void{
        if let iconImg = icon.image {
            let renderMode = defaultIconColor.cgColor.alpha == 0 ? UIImageRenderingMode.alwaysOriginal:UIImageRenderingMode.alwaysTemplate
            let renderImage = iconImg.withRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
        
        textLb.textColor = defaultTextColor
        
        
    }
    
    open override func selectState(_ icon:UIImageView,textLb:UILabel) -> Void{
        selectedColor(icon, textLb: textLb)
    }
    
    func selectedColor(_ icon:UIImageView,textLb:UILabel) -> Void {
        if let iconImage = icon.image, iconSelectedColor != nil{
          let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
        textLb.textColor=textSelctedColor
    }
    
}

open class TLFlipLeftTransitionAnimation: TLTransitionAnimation {
  public  override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions.transitionFlipFromLeft
    }
}

open class TLFlipRightTransitionAnimation: TLTransitionAnimation {
  public  override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions.transitionFlipFromRight
    }
}

open class TLFlipBottomTransitionAnimation: TLTransitionAnimation {
  public  override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions.transitionFlipFromBottom
    }
}


class TLFlipTopTransitionAnimation: TLTransitionAnimation {
   public override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions.transitionFlipFromTop
    }
}













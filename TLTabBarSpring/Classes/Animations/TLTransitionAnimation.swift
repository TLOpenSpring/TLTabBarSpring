//
//  TLTransitionAnimation.swift
//  Pods
//
//  Created by Andrew on 16/5/30.
//
//

import UIKit

public class TLTransitionAnimation: TLBaseAnimation {

    public var transitionOptions : UIViewAnimationOptions!
    
    
  public override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions.TransitionNone
    }
    
  public  init(transition:UIViewAnimationOptions) {
      super.init()
     transitionOptions = transition
    }
    
    public override func startAnimation(icon:UIImageView,textLb:UILabel) -> Void{
        selectedColor(icon, textLb: textLb)
        
        UIView.transitionWithView(icon, duration: NSTimeInterval(duration), options: transitionOptions, animations: {
            
            }, completion: nil)
    }
    
    public override func deSelectAnimation(icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                                  defaultIconColor:UIColor) -> Void{
        if let iconImg = icon.image {
            let renderMode = CGColorGetAlpha(defaultIconColor.CGColor) == 0 ? UIImageRenderingMode.AlwaysOriginal:UIImageRenderingMode.AlwaysTemplate
            let renderImage = iconImg.imageWithRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
        
        textLb.textColor = defaultTextColor
        
        
    }
    
    public override func selectState(icon:UIImageView,textLb:UILabel) -> Void{
        selectedColor(icon, textLb: textLb)
    }
    
    func selectedColor(icon:UIImageView,textLb:UILabel) -> Void {
        if let iconImage = icon.image where iconSelectedColor != nil{
          let renderImage = iconImage.imageWithRenderingMode(.AlwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
        textLb.textColor=textSelctedColor
    }
    
}

public class TLFlipLeftTransitionAnimation: TLTransitionAnimation {
  public  override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
    }
}

public class TLFlipRightTransitionAnimation: TLTransitionAnimation {
  public  override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions.TransitionFlipFromRight
    }
}

public class TLFlipBottomTransitionAnimation: TLTransitionAnimation {
  public  override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions.TransitionFlipFromBottom
    }
}


class TLFlipTopTransitionAnimation: TLTransitionAnimation {
   public override init() {
        super.init()
        transitionOptions = UIViewAnimationOptions.TransitionFlipFromTop
    }
}













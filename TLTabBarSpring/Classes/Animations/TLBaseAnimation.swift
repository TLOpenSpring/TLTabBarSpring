//
//  TLBaseAnimation.swift
//  Pods
//
//  Created by Andrew on 16/5/27.
//
//

import UIKit

public let TLScreen_width = UIScreen.main.bounds.width
public let TLScreen_height = UIScreen.main.bounds.height

protocol TLAnimationProtocol {
    func startAnimation(_ icon:UIImageView,textLb:UILabel) -> Void;
    /**
     取消选定
     
     - parameter icon:             TabBar的图标
     - parameter textLb:           TabBar的标题
     - parameter defaultTextColor: TabBar默认文字颜色
     - parameter defaultIconColor: TabBar默认图标的颜色
     
     - returns:
     */
    func deSelectAnimation(_ icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                         defaultIconColor:UIColor) -> Void;
    
    /**
     选中的状态
     
     - parameter icon:   图标
     - parameter textLb: 标题
     
     - returns: <#return value description#>
     */
    func selectState(_ icon:UIImageView,textLb:UILabel) -> Void;
}


open class TLBaseAnimation: NSObject,TLAnimationProtocol {
    
    public struct AnimationKeys{
        static let Scale = "transform.scale"
        static let Rotation = "transform.rotation"
        static let KeyFrame = "contents"
        static let PositionY = "position.y"
    }
    
    //MARK: - properties
   open var duration:CGFloat=0.5
   open var textSelctedColor:UIColor!
   open var iconSelectedColor:UIColor!

    
   open func startAnimation(_ icon:UIImageView,textLb:UILabel) -> Void{
    
    }
    
   open func deSelectAnimation(_ icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                         defaultIconColor:UIColor) -> Void{
    
    }
    
   open func selectState(_ icon:UIImageView,textLb:UILabel) -> Void{
    
    }
}











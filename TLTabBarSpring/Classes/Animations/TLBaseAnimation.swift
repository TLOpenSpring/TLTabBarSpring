//
//  TLBaseAnimation.swift
//  Pods
//
//  Created by Andrew on 16/5/27.
//
//

import UIKit

protocol TLAnimationProtocol {
    func startAnimation(icon:UIImageView,textLb:UILabel) -> Void;
    
    func selectAnimation(icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                         defaultIconColor:UIColor) -> Void;
    
    func selectState(icon:UIImageView,textLb:UILabel) -> Void;
}


public class TLBaseAnimation: NSObject,TLAnimationProtocol {

    
    func startAnimation(icon:UIImageView,textLb:UILabel) -> Void{
    
    }
    
    func selectAnimation(icon:UIImageView,textLb:UILabel,defaultTextColor:UIColor,
                         defaultIconColor:UIColor) -> Void{
    
    }
    
    func selectState(icon:UIImageView,textLb:UILabel) -> Void{
    
    }
}

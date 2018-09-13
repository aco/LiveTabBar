//
//  DefaultAnimation.swift
//  LiveTabBar
//
//  Created by ac on 12/09/2018.
//

import Foundation

public struct DefaultAnimation {
    
    /// Light compression with a small spring on completion
    public static var spring: CAAnimation = {
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        keyframeAnimation.values = [1.0, 0.9, 1.04, 1.0]
        keyframeAnimation.duration = 0.3
        keyframeAnimation.calculationMode = kCAAnimationCubic
        
        return keyframeAnimation
    }()
    
    /// More prominent bouncing compared to ```DefaultAnimation.spring```
    public static var bounce: CAAnimation = {
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        keyframeAnimation.values = [1.0, 0.9, 0.85, 1.05, 1.03, 1.0, 0.95, 1.0]
        keyframeAnimation.duration = 0.4
        keyframeAnimation.calculationMode = kCAAnimationCubic
        
        return keyframeAnimation
    }()
    
    /// Wobbles up and down
    public static var wobble: CAAnimation = {
        let keyframeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        
        keyframeAnimation.values = [0.0 ,-6.0, 2.0, -2.0, 2.0, -1.0, 0.0]
        keyframeAnimation.duration = 0.8
        keyframeAnimation.calculationMode = kCAAnimationCubic
        
        return keyframeAnimation
    }()
    
    /// Eased rotation
    public static var spin: CAAnimation = {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * 2.0)
        rotateAnimation.duration = 0.4
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        return rotateAnimation
    }()
}

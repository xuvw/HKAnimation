//
//  HKRotationByZ.swift
//  HKAnimation
//
//  Created by heke on 16/7/14.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class HKRotationByZ: HKAnimationDescription {
    override func createAnimation() ->CAAnimation? {
        
        if getAnimationType() == AnimationType.Basic {
            let path = self.path!.rawValue
            let basicAnimation = CABasicAnimation(keyPath: path)
            basicAnimation.fromValue = fromValue
            basicAnimation.toValue = toValue
            basicAnimation.byValue = byValue
            
            basicAnimation.duration = duration
            basicAnimation.timingFunction = CAMediaTimingFunction(name: pase!)
            basicAnimation.fillMode = fillMode
            basicAnimation.removedOnCompletion = false
            
            let animationDelegate = HKAnimationProxyDelegate()
            animationDelegate.animationStartCallback = self.animationStartCallback
            animationDelegate.animationStopCallback  = self.animationStopCallback
            basicAnimation.delegate = animationDelegate
            
            return basicAnimation
            
        }else if getAnimationType() == AnimationType.Keyframe {
            
            return nil
        }else {
            
            print("params error can not create an Animation!!!!!!")
            return nil
        }
    }
}

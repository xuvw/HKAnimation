//
//  HKAnimationProxyDelegate.swift
//  HKAnimation
//
//  Created by heke on 16/7/9.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class HKAnimationProxyDelegate: NSObject {
    
    var animationStartCallback: (() ->Void)?
    var animationStopCallback: (() ->Void)?
    
    override func animationDidStart(anim: CAAnimation) {
        animationStartCallback?()
//        print("animationDidStart")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        animationStopCallback?()
//        print("animationDidStop")
    }
}
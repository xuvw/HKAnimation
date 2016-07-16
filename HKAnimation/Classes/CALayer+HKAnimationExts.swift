//
//  CALayer+HKAnimationExts.swift
//  HKAnimation
//
//  Created by heke on 16/7/1.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

extension CALayer {
    
    func hk_CreateAnimation(config: (config: HKAnimationConfig) ->Void) {
        
        let internalconfig = HKAnimationConfig.configWithLayer(self)
        config(config: internalconfig)
        
        let animation = internalconfig.createAnimations()
        animation.installTo(self)
    }
}

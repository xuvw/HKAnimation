//
//  anchorPointViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class anchorPointViewController: BaseAnimationViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "anchorPoint"
    }

    override func createAnimation() {
        aLayer!.hk_CreateAnimation { (config) in
            config.anchorPoint
                .setFromValue(NSValue(CGPoint: CGPointMake(0.5, 0.5)))
                .setToValue(NSValue(CGPoint: CGPointMake(0, 0)))
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }
}

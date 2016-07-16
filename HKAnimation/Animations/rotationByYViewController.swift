//
//  rotationByYViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/14.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class rotationByYViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        self.bgLayer?.hidden = true
        aLayer?.zPosition = 1000
        aLayer!.transform = HKGeometry.rotateTransformWith(0,
                                                           toTransform: CATransform3DIdentity,
                                                           rotateDirectioin: HKRotateDirection.clockwise,
                                                           axis: HKAxis.y)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func createAnimation() {
        aLayer!.hk_CreateAnimation { (config) in
            config.rotationByY
                //                .setFromValue(NSNumber(float: 0))
                .setToValue(NSNumber(float: Float((180) * degreeToRadianUnit))) //
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }

}

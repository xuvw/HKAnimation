//
//  rotationByZViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/14.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class rotationByZViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        aLayer?.zPosition = 1000
        aLayer!.transform = HKGeometry.rotateTransformWith(0,
                                                           toTransform: CATransform3DIdentity,
                                                           rotateDirectioin: HKRotateDirection.clockwise,
                                                           axis: HKAxis.z)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func createAnimation() {
        aLayer!.hk_CreateAnimation { (config) in
            config.rotationByZ
                //                .setFromValue(NSNumber(float: 0))
                .setToValue(NSNumber(float: Float((180) * degreeToRadianUnit))) //
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }

}

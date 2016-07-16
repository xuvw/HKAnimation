//
//  zPositionViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/14.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class zPositionViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        CATransaction.begin()
        CATransaction.setDisableActions(true)
        aLayer!.shadowPath = HKGeometry.pathWith(aLayer!.bounds, inset: UIEdgeInsetsMake(10, 10, 10, 10), cornerRadius: 0.000001)
        //UIBezierPath(roundedRect: aLayer!.bounds, cornerRadius: 0).CGPath
        aLayer!.shadowColor = UIColor.blackColor().CGColor
        aLayer!.shadowOpacity = 0.3
        aLayer!.shadowRadius = 5
        aLayer!.shadowOffset = CGSize(width: 0, height: 0)
        
        CATransaction.commit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func createAnimation() {
        aLayer!.hk_CreateAnimation { (config) in
            config.zPosition
                .setFromValue(NSNumber(float: 0))
                .setToValue(NSNumber(float: 10000))
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }

}

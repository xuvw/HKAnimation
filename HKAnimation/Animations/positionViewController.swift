//
//  positionViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class positionViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func createAnimation() {
        aLayer!.hk_CreateAnimation { (config) in
            config.position
                .setFromValue(NSValue(CGPoint: self.aLayer!.position))
                .setToValue(NSValue(CGPoint: CGPointMake(250, 250)))
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }

}

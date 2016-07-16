//
//  opacityViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class opacityViewController: BaseAnimationViewController {

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
            config.opacity
                .setFromValue(NSNumber(float: 1))
                .setToValue(NSNumber(float: 0))
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }

}

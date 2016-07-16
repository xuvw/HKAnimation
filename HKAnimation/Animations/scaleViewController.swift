//
//  scaleViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/15.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class scaleViewController: BaseAnimationViewController {

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
            config.scale
                //                .setFromValue(NSNumber(float: 0))
                .setToValue(NSValue(CGSize:CGSizeMake(0.5, 0.5))) //
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }

}

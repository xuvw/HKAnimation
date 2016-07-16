//
//  backgroundColorViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class backgroundColorViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        aLayer?.contents = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func createAnimation() {
        aLayer!.hk_CreateAnimation { (config) in
            config.backgroundColor
                .setFromValue(UIColor.redColor().CGColor)
                .setToValue(UIColor.greenColor().CGColor)
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }

}

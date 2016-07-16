//
//  shadowColorViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class shadowColorViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func createAnimation() {
        aLayer?.shadowOffset = CGSizeMake(10, 10)
        aLayer?.shadowOpacity = 0.9
        aLayer?.hk_CreateAnimation({ (config) in
            config.shadowColor
                .setFromValue(UIColor.greenColor().CGColor)
                .setToValue(UIColor.orangeColor().CGColor)
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        })
    }

}

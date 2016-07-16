//
//  shadowOffsetViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class shadowOffsetViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func createAnimation() {
        aLayer?.shadowOffset = CGSizeMake(0, 0)
        aLayer?.shadowOpacity = 0.9
        aLayer?.hk_CreateAnimation({ (config) in
            config.shadowOffset
                .setFromValue(NSValue(CGSize: CGSizeMake(0, 0)))
                .setToValue(NSValue(CGSize: CGSizeMake(20, 20)))
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        })
    }

}

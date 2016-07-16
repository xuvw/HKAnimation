//
//  boundsViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class boundsViewController: BaseAnimationViewController {

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
            config.bounds
                .setFromValue(NSValue(CGRect: self.aLayer!.bounds))
                .setToValue(NSValue(CGRect: CGRectMake(0, 0, 200, 200)))
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }

}

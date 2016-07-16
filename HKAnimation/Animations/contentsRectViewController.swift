//
//  contentsRectViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class contentsRectViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        aLayer?.contents = UIImage(named: "content")?.CGImage
        aLayer?.contentsScale = UIScreen.mainScreen().scale
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func createAnimation() {
        
        aLayer!.hk_CreateAnimation { (config) in
            config.contentsRect
                .setFromValue(NSValue(CGRect: CGRectMake(0, 0, 1, 1)))
                .setToValue(NSValue(CGRect: CGRectMake(0, 0, 0.2, 0.2)))
                .setPase(AnimationPase.EaseInEaseOut)
                .setDuration(2)
        }
    }

}

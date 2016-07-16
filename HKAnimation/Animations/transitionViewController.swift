//
//  transitionViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/16.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class transitionViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        aLayer?.removeFromSuperlayer()
        aLayer?.frame = bgLayer!.bounds
        bgLayer?.addSublayer(aLayer!)
        aLayer?.contents = nil
        bgLayer?.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func createAnimation() {
        let transitionAnimation = CATransition()
        transitionAnimation.startProgress = 0
        transitionAnimation.endProgress = 1
        transitionAnimation.type = kCATransitionReveal
        transitionAnimation.subtype = kCATransitionFromLeft
        transitionAnimation.duration = 0.5
        
        aLayer!.removeAnimationForKey("push")
        
        aLayer?.backgroundColor = UIColor.greenColor().CGColor
        aLayer!.addAnimation(transitionAnimation, forKey: "push")
    }
}

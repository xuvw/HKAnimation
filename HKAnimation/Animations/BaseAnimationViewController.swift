//
//  BaseAnimationViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class BaseAnimationViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var aLayer: CALayer?
    var bgLayer: CALayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        let bgLayer = CALayer()
        bgLayer.backgroundColor = UIColor.grayColor().CGColor
        bgLayer.frame = CGRectMake(100, 100, 100, 100)
        view.layer.addSublayer(bgLayer)
        self.bgLayer = bgLayer
        
        aLayer = CALayer()
        aLayer!.frame = CGRectMake(100, 100, 100, 100)
        aLayer?.backgroundColor = UIColor.redColor().CGColor
        view.layer.addSublayer(aLayer!)
        
        aLayer?.contents = UIImage(named: "content")?.CGImage
        
        var perspect = CATransform3DIdentity
//        perspect.m34 = -1/500.0
        view.layer.sublayerTransform = perspect
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        createAnimation()
    }
    
    func createAnimation() {
        //--
    }
}

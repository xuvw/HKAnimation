//
//  flipViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/16.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class flipViewController: BaseAnimationViewController {

    var viewA: UIView?
    var viewB: UIView?
    var containerView: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()

        containerView = UIView(frame: CGRectMake(100, 100, 100, 100))
        view.addSubview(containerView!)
        
        viewA = UIView(frame: CGRectMake(0, 0, 100, 100))
        viewA!.backgroundColor = UIColor.redColor()
        
        viewB = UIView(frame: CGRectMake(0, 0, 100, 100))
        viewB!.backgroundColor = UIColor.greenColor()
        
        containerView!.addSubview(viewA!)
        containerView!.addSubview(viewB!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func createAnimation() {
//        UIView.transitionFromView(viewB!,
//                                  toView: viewA!,
//                                  duration: 2,
//                                  options: UIViewAnimationOptions.TransitionFlipFromLeft,
//                                  completion: {value in
//                                    //--
//        })
        
        
        UIView.transitionWithView(containerView!, duration: 3, options: UIViewAnimationOptions.TransitionCurlUp, animations: {
                self.viewB?.removeFromSuperview()
            }, completion: {value in})
    }

}

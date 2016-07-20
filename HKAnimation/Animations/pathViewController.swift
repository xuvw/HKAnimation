//
//  pathViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/18.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class pathViewController: BaseAnimationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        bgLayer?.backgroundColor = UIColor.whiteColor().CGColor
        let shape = CAShapeLayer()
        shape.frame = aLayer!.bounds
        aLayer?.mask = shape
        shape.path = UIBezierPath.pathWith(aLayer!.bounds, topLeftCornerRadius: 20, topRightCornerRadius: 0, bottomLeftCornerRadius: 0, bottomRightCornerRadius: 30)
        
        let viewA = UIView(frame: CGRectMake(100, 210, 70, 70))
        viewA.backgroundColor = UIColor.redColor()
        view.addSubview(viewA)
        
        viewA.setCorners(topRightCornerRadius: 35,
                         topRightCornerRadius: 35,
                         bottomLeftCornerRadius: 35,
                         bottomRightCornerRadius: 35)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

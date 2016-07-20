//
//  UIView+HKAnimationExts.swift
//  HKAnimation
//
//  Created by heke on 16/7/19.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setCorners(topRightCornerRadius topLeftCornerRadius: CGFloat,
                    topRightCornerRadius: CGFloat,
                    bottomLeftCornerRadius: CGFloat,
                    bottomRightCornerRadius: CGFloat) {
        let shape = CAShapeLayer()
        shape.frame = self.bounds
        self.layer.mask = shape
        
        shape.path = UIBezierPath.pathWith(shape.bounds,
                                           topLeftCornerRadius: topLeftCornerRadius,
                                           topRightCornerRadius: topRightCornerRadius,
                                           bottomLeftCornerRadius: bottomLeftCornerRadius,
                                           bottomRightCornerRadius: bottomRightCornerRadius)
        shape.allowsEdgeAntialiasing = true
        shape.contentsScale = UIScreen.mainScreen().scale
    }
}
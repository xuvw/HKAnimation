//
//  HKGeometry.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

enum HKRotateDirection {
    case clockwise
    case counterclockwise
}

enum HKAxis {
    case x
    case y
    case z
}

/**
 degree
 radian
 */
let degreeToRadianUnit = CGFloat(M_PI/180)
let radianToDegreeUnit = CGFloat(180/M_PI)

class HKGeometry {
    /**
     inset.item > 0 扩大
     inset.item < 0 缩小
     */
    class func pathWith(rect:CGRect, inset:UIEdgeInsets = UIEdgeInsetsZero, cornerRadius: CGFloat = 0) ->CGPath {
        
        let x = rect.origin.x - inset.left
        let y = rect.origin.y - inset.top
        let width = rect.size.width + inset.left + inset.right
        let height = rect.size.height + inset.top + inset.bottom
        let newRt = CGRectMake(x, y, width, height)
        
        let path = CGPathCreateWithRoundedRect(newRt, cornerRadius, cornerRadius, nil)
        
        return path
    }
    
    class func rotateTransformWith(degree: CGFloat,
                                   toTransform: CATransform3D = CATransform3DIdentity,
                                   rotateDirectioin: HKRotateDirection = .clockwise,
                                   axis: HKAxis = .x) ->CATransform3D {
        //
        var t = CATransform3DIdentity
        t.m34 = -1/200.0
        let factor = CGFloat( rotateDirectioin == .clockwise ? 1 : -1 )
        return CATransform3DRotate(t,
                                   factor * degree * degreeToRadianUnit,
                                   (axis == .x ? 1 : 0), (axis == .y ? 1 : 0), (axis == .z ? 1 : 0))
    }
    
}
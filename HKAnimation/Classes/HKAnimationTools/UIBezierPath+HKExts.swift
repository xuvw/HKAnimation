//
//  UIBezierPath+HKExts.swift
//  HKAnimation
//
//  Created by heke on 16/7/18.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

extension UIBezierPath {
    
    /**
     #1#2*         1*#2#
    ->1*             2*
     
     
     
     2*              1*
     #4#1*         2*#3#
     */
    class func pathWith(rect: CGRect,
                        topLeftCornerRadius: CGFloat,
                        topRightCornerRadius: CGFloat,
                        bottomLeftCornerRadius: CGFloat,
                        bottomRightCornerRadius: CGFloat) ->CGPathRef {
        
        let bPath = UIBezierPath()
        bPath.lineWidth = 1.0/UIScreen.mainScreen().scale
        
        let rt = rect
        var startP = CGPointZero
        var p = CGPointZero
        var p1 = CGPointZero
        var c1 = CGPointZero
        
        //corner:1
        p = rt.origin
        if topLeftCornerRadius > 0 {
            //p1
            p1.x = p.x
            p1.y = p.y + topLeftCornerRadius
            startP = p1
            //c1
            c1.y = p1.y
            c1.x = p1.x + topLeftCornerRadius
            
            bPath.moveToPoint(p1)
            bPath.addArcWithCenter(c1,
                                   radius: topLeftCornerRadius,
                                   startAngle: CGFloat(M_PI),
                                   endAngle: CGFloat(3/2.0 * M_PI),
                                   clockwise: true)
            
        }else {
            bPath.moveToPoint(p)
            startP = p
        }
        
        //corner:2
        p.y = rt.origin.y
        p.x = rt.size.width + rt.origin.x
        if topRightCornerRadius > 0 {
            //p1
            p1.x = p.x - topRightCornerRadius
            p1.y = p.y
            //c1
            c1.y = p1.y + topRightCornerRadius
            c1.x = p1.x
            
            bPath.addLineToPoint(p1)
            bPath.addArcWithCenter(c1,
                                   radius: topRightCornerRadius,
                                   startAngle: CGFloat(3/2.0 * M_PI),
                                   endAngle: CGFloat(2.0 * M_PI),
                                   clockwise: true)
            
        }else {
            bPath.addLineToPoint(p)
        }
        
        //corner:3
        p.x = rt.origin.x + rt.size.width
        p.y = rt.origin.y + rt.size.height
        if bottomRightCornerRadius > 0 {
            //p1
            p1.x = p.x
            p1.y = p.y - bottomRightCornerRadius
            
            //c1
            c1.y = p1.y
            c1.x = p1.x - bottomRightCornerRadius
            
            bPath.addLineToPoint(p1)
            bPath.addArcWithCenter(c1,
                                   radius: bottomRightCornerRadius,
                                   startAngle: 0,
                                   endAngle: CGFloat(1/2.0 * M_PI),
                                   clockwise: true)
            
        }else {
            bPath.addLineToPoint(p)
        }
        
        //corner:4
        p.x = rt.origin.x
        p.y = rt.origin.y + rt.size.height
        if bottomLeftCornerRadius > 0 {
            //p1
            p1.x = p.x + bottomLeftCornerRadius
            p1.y = p.y
            
            //c1
            c1.y = p1.y - bottomLeftCornerRadius
            c1.x = p1.x
            
            bPath.addLineToPoint(p1)
            bPath.addArcWithCenter(c1,
                                   radius: bottomLeftCornerRadius,
                                   startAngle: CGFloat(1/2.0 * M_PI),
                                   endAngle: CGFloat(M_PI),
                                   clockwise: true)
            
        }else {
            bPath.addLineToPoint(p)
        }
        
        bPath.addLineToPoint(startP)
        
        return bPath.CGPath
    }
}
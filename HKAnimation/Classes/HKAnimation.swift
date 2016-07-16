//
//  HKAnimation.swift
//  HKAnimation
//
//  Created by heke on 16/7/1.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

class HKAnimation {
    var animations = [String : CAAnimation]()
    var animation: CAAnimation? //real Animation[s]
    var animationKey = ""
    
    func installTo(layer: CALayer) {
        if animation != nil {
            layer .addAnimation(animation!, forKey: animationKey)
        }else {
            print("animation not exist!!!");
        }
    }
}
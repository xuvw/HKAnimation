//
//  HKAnimationConfig.swift
//  HKAnimation
//
//  Created by heke on 16/7/1.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

enum HKAnimatableProperty: String {
    case anchorPoint     = "anchorPoint"
    case backgroundColor = "backgroundColor"
    case borderColor     = "borderColor"
    case borderWidth     = "borderWidth"
    case bounds          = "bounds"
    case cornerRadius    = "cornerRadius"
    case contentsRect    = "contentsRect"
    case opacity         = "opacity"
    case position        = "position"
    case shadowColor     = "shadowColor"
    case shadowOffset    = "shadowOffset"
    case shadowOpacity   = "shadowOpacity"
    case shadowRadius    = "shadowRadius"
    case shadowPath      = "shadowPath"
    case zPosition       = "zPosition"
    
    //rotation:
    case rotationByX     = "transform.rotation.x"
    case rotationByY     = "transform.rotation.y"
    case rotationByZ     = "transform.rotation.z"
    
    case scaleByX        = "transform.scale.x"
    case scaleByY        = "transform.scale.y"
    case scaleByZ        = "transform.scale.z"
    case scale           = "transform.scale"
    
    case translationByX  = "transform.translation.x"
    case translationByY  = "transform.translation.y"
    case translationByZ  = "transform.translation.z"
    case translation     = "transform.translation"
}

class HKAnimationConfig {
    var animationGroupStartCallback: (() ->Void)? = nil
    var animationGroupStopCallback: (() ->Void)? = nil
    
    private var animationDescriptions = [String : HKAnimationDescription]()
    private var layer: CALayer?
    
    class func configWithLayer(layer: CALayer) ->HKAnimationConfig{
        let config = HKAnimationConfig()
        config.layer = layer
        return config
    }
    
    /**
     提取配置生成动画对象
     */
    func createAnimations() ->HKAnimation {
        let hkAnimation = HKAnimation()
        
        //属性动画生成
        var animationLen: NSTimeInterval = 0
        for (key, animationDescription) in animationDescriptions {
            
            let animation = animationDescription.createAnimation()
            if animation != nil {
                hkAnimation.animations[key] = animation!
                
                //计算组合动画时长
                if animationLen < 0.1 {
                    animationLen = animationDescription.duration
                    animationLen += animationDescription.animationOffset
                }else {
                    let len = animationDescription.duration + animationDescription.animationOffset
                    if (len - animationLen) > 0.0001 {
                        animationLen += len - animationLen
                    }else {
                        //--
                    }
                }
            }
        }
        
        //属性动画组装：
        if hkAnimation.animations.count > 1 {
            var animations = [CAAnimation]()
            
            for (key, animation) in hkAnimation.animations {
                animations.append(animation)
                print("key: \(key)")
            }
            let animationGroup = CAAnimationGroup()
            animationGroup.duration = animationLen
            animationGroup.animations = animations
            animationGroup.fillMode = kCAFillModeForwards
            animationGroup.removedOnCompletion = false
            
            let animationDelegate = HKAnimationProxyDelegate()
            animationDelegate.animationStartCallback = self.animationGroupStartCallback
            animationDelegate.animationStopCallback  = self.animationGroupStopCallback
            animationGroup.delegate = animationDelegate
            
            hkAnimation.animation = animationGroup
        }else {
            for (key, animation) in hkAnimation.animations {
                hkAnimation.animation = animation
                print("key: \(key)")
                break
            }
        }
        //返回
        return hkAnimation
    }
}

/**
 config animation
 */
extension HKAnimationConfig {
    var anchorPoint: HKAnchorPoint {
        get {
            let animationDesc = HKAnchorPoint()
            animationDesc.path = HKAnimatableProperty.anchorPoint
            
            animationDescriptions[HKAnimatableProperty.anchorPoint.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var backgroundColor: HKBackgroundColor {
        get {
            let animationDesc = HKBackgroundColor()
            animationDesc.path = HKAnimatableProperty.backgroundColor
            
            animationDescriptions[HKAnimatableProperty.backgroundColor.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var borderColor: HKBorderColor {
        get {
            let animationDesc = HKBorderColor()
            animationDesc.path = HKAnimatableProperty.borderColor
            
            animationDescriptions[HKAnimatableProperty.borderColor.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var borderWidth: HKBorderWidth {
        get {
            let animationDesc = HKBorderWidth()
            animationDesc.path = HKAnimatableProperty.borderWidth
            
            animationDescriptions[HKAnimatableProperty.borderWidth.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    //borderWidth
    
    var bounds: HKBounds {
        get {
            let animationDesc = HKBounds()
            animationDesc.path = HKAnimatableProperty.bounds
            
            animationDescriptions[HKAnimatableProperty.bounds.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var cornerRadius: HKCornerRadius {
        get {
            let animationDesc = HKCornerRadius()
            animationDesc.path = HKAnimatableProperty.cornerRadius
            
            animationDescriptions[HKAnimatableProperty.cornerRadius.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var contentsRect: HKContentsRect {
        get {
            let animationDesc = HKContentsRect()
            animationDesc.path = HKAnimatableProperty.contentsRect
            
            animationDescriptions[HKAnimatableProperty.contentsRect.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var opacity: HKOpacity {
        get {
            let animationDesc = HKOpacity()
            animationDesc.path = HKAnimatableProperty.opacity
            
            animationDescriptions[HKAnimatableProperty.opacity.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var position: HKPosition {
        get {
            let animationDesc = HKPosition()
            animationDesc.path = HKAnimatableProperty.position
            
            animationDescriptions[HKAnimatableProperty.position.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var shadowColor: HKShadowColor {
        get {
            let animationDesc = HKShadowColor()
            animationDesc.path = HKAnimatableProperty.shadowColor
            
            animationDescriptions[HKAnimatableProperty.shadowColor.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var shadowOffset: HKShadowOffset {
        get {
            let animationDesc = HKShadowOffset()
            animationDesc.path = HKAnimatableProperty.shadowOffset
            
            animationDescriptions[HKAnimatableProperty.shadowOffset.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var shadowOpacity: HKShadowOpacity {
        get {
            let animationDesc = HKShadowOpacity()
            animationDesc.path = HKAnimatableProperty.shadowOpacity
            
            animationDescriptions[HKAnimatableProperty.shadowOpacity.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var shadowRadius: HKShadowRadius {
        get {
            let animationDesc = HKShadowRadius()
            animationDesc.path = HKAnimatableProperty.shadowRadius
            
            animationDescriptions[HKAnimatableProperty.shadowRadius.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var shadowPath: HKShadowPath {
        get {
            let animationDesc = HKShadowPath()
            animationDesc.path = HKAnimatableProperty.shadowPath
            
            animationDescriptions[HKAnimatableProperty.shadowPath.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var zPosition: HKZPosition {
        get {
            let animationDesc = HKZPosition()
            animationDesc.path = HKAnimatableProperty.zPosition
            
            animationDescriptions[HKAnimatableProperty.zPosition.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var rotationByX: HKRotationByX {
        get {
            let animationDesc = HKRotationByX()
            animationDesc.path = HKAnimatableProperty.rotationByX
            
            animationDescriptions[HKAnimatableProperty.rotationByX.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var rotationByY: HKRotationByY {
        get {
            let animationDesc = HKRotationByY()
            animationDesc.path = HKAnimatableProperty.rotationByY
            
            animationDescriptions[HKAnimatableProperty.rotationByY.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var rotationByZ: HKRotationByZ {
        get {
            let animationDesc = HKRotationByZ()
            animationDesc.path = HKAnimatableProperty.rotationByZ
            
            animationDescriptions[HKAnimatableProperty.rotationByZ.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var scaleByX: HKScaleByX {
        get {
            let animationDesc = HKScaleByX()
            animationDesc.path = HKAnimatableProperty.scaleByX
            
            animationDescriptions[HKAnimatableProperty.scaleByX.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var scaleByY: HKScaleByY{
        get {
            let animationDesc = HKScaleByY()
            animationDesc.path = HKAnimatableProperty.scaleByY
            
            animationDescriptions[HKAnimatableProperty.scaleByY.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var scaleByZ: HKScaleByZ {
        get {
            let animationDesc = HKScaleByZ()
            animationDesc.path = HKAnimatableProperty.scaleByZ
            
            animationDescriptions[HKAnimatableProperty.scaleByZ.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var scale: HKScale {
        get {
            let animationDesc = HKScale()
            animationDesc.path = HKAnimatableProperty.scale
            
            animationDescriptions[HKAnimatableProperty.scale.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var translationByX: HKTranslationByX {
        get {
            let animationDesc = HKTranslationByX()
            animationDesc.path = HKAnimatableProperty.translationByX
            
            animationDescriptions[HKAnimatableProperty.translationByX.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var translationByY: HKTranslationByY {
        get {
            let animationDesc = HKTranslationByY()
            animationDesc.path = HKAnimatableProperty.translationByY
            
            animationDescriptions[HKAnimatableProperty.translationByY.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var translationByZ: HKTranslationByZ {
        get {
            let animationDesc = HKTranslationByZ()
            animationDesc.path = HKAnimatableProperty.translationByZ
            
            animationDescriptions[HKAnimatableProperty.translationByZ.rawValue] = animationDesc
            
            return animationDesc
        }
    }
    
    var translation: HKTranslation {
        get {
            let animationDesc = HKTranslation()
            animationDesc.path = HKAnimatableProperty.translation
            
            animationDescriptions[HKAnimatableProperty.translation.rawValue] = animationDesc
            
            return animationDesc
        }
    }
}
//
//  HKAnimationDescription.swift
//  HKAnimation
//
//  Created by heke on 16/7/1.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

enum AnimationType {
    case Basic
    case Keyframe
    case Invalid
}

enum AnimationPase {
    case Linear
    case EaseIn
    case EaseOut
    case EaseInEaseOut
    case Default
    
    func stringValue() -> String {
        switch self {
        case .Linear:
            return kCAMediaTimingFunctionLinear
            
        case .EaseIn:
            return kCAMediaTimingFunctionEaseIn
            
        case .EaseOut:
            return kCAMediaTimingFunctionEaseOut
            
        case .EaseInEaseOut:
            return kCAMediaTimingFunctionEaseInEaseOut
            
        case .Default:
            return kCAMediaTimingFunctionDefault
        }
    }
}

enum AnimationFillMode {
    case Forwards
    case Backwards
    case Both
    case Removed
    
    func stringValue() -> String {
        switch self {
        case .Forwards:
            return kCAFillModeForwards
            
        case .Backwards:
            return kCAFillModeBackwards
            
        case .Both:
            return kCAFillModeBoth
            
        case .Removed:
            return kCAFillModeRemoved
        }
    }
}

class HKAnimationDescription {
    
    var path: HKAnimatableProperty?
    
    private(set) var duration: NSTimeInterval = 0
    private(set) var fillMode = AnimationFillMode.Forwards.stringValue()
    
    private(set) var animationStartCallback: (() ->Void)? = nil
    private(set) var animationStopCallback: (() ->Void)? = nil
    
    private(set) var animationBeginTime: NSTimeInterval = 0
    private(set) var animationOffset: NSTimeInterval = 0
    private(set) var animationSpeed: CGFloat = 1
    
    //for CABasicAnimation
    private(set) var fromValue: AnyObject? = nil
    private(set) var byValue: AnyObject? = nil
    private(set) var toValue: AnyObject? = nil
    private(set) var pase: String? = AnimationPase.Linear.stringValue()
    
    //for CAKeyframeAnimation
    private(set) var values: [AnyObject]? = nil
    private(set) var keyTimes: [NSNumber]? = nil
    private(set) var pases: [AnimationPase]? = nil
    
    //
    func createAnimation() ->CAAnimation? {
        return nil
    }
    
    /**
     设置动画时长，默认：0.25SEC
     */
    func setDuration(duration: NSTimeInterval = 0.25) ->HKAnimationDescription {
        self.duration = duration
        return self
    }
    
    /**
     设置动画节奏，默认：AnimationPase.EaseIn
     */
    func setPase(pase: AnimationPase = AnimationPase.EaseIn) ->HKAnimationDescription {
        self.pase = pase.stringValue()
        return self
    }
    
    /**
     设置动画填充模式，默认：AnimationFillMode.Forwards
     */
    func setFillMode(fillMode: AnimationFillMode = AnimationFillMode.Forwards) ->HKAnimationDescription {
        self.fillMode = fillMode.stringValue()
        return self
    }
    
    //MARK:CABasicAnimation
    
    /**
     设置动画起始值，类型：具体类型根据当前动画属性而不同
     */
    func setFromValue(fromValue: AnyObject) ->HKAnimationDescription {
        self.fromValue = fromValue
        return self
    }
    
    /**
     设置动画中间值，类型：具体类型根据当前动画属性而不同
     */
    func setByValue(byValue: AnyObject) ->HKAnimationDescription {
        self.byValue = byValue
        return self
    }
    
    /**
     设置动画结束值，类型：具体类型根据当前动画属性而不同
     */
    func setToValue(toValue: AnyObject) ->HKAnimationDescription {
        self.toValue = toValue
        return self
    }
    
    //MARK:CAKeyFrameAnimation
    /**
     设置动画关键帧值，类型：[AnyObject]
     具体类型根据当前动画属性而不同
     */
    func setValues(values: [AnyObject]) ->HKAnimationDescription {
        self.values = values
        return self
    }
    
    /**
     设置动画关键帧时间点，类型：[NSNumber]
     */
    func setKeyTimes(keyTimes: [NSNumber]) ->HKAnimationDescription {
        self.keyTimes = keyTimes
        return self
    }
    
    /**
     设置动画启动回调，类型: () ->Void,
     若是groupAnimation则此回调失效
     */
    func setStartCallback(startCallback:(()->Void)) ->HKAnimationDescription {
        self.animationStartCallback = startCallback
        return self
    }
    
    /**
     设置动画结束回调，类型: () ->Void
     若是groupAnimation则此回调失效
     */
    func setStopCallback(stopCallback:(()->Void)) ->HKAnimationDescription {
        self.animationStopCallback = stopCallback
        return self
    }
    
    /**
     设置动画开始时间，默认值：0
     */
    func setBeginTime(beginTime: NSTimeInterval = 0) ->HKAnimationDescription {
        self.animationBeginTime = beginTime
        return self
    }
    
    /**
     设置动画偏移，默认值：0
     */
    func setOffset(offsetTime: NSTimeInterval = 0) ->HKAnimationDescription {
        self.animationOffset = offsetTime
        return self
    }
    
    /**
     设置动画速度，默认值：1
     */
    func setSpeed(speed: CGFloat = 1) ->HKAnimationDescription {
        self.animationSpeed = speed
        return self
    }
    
    func getAnimationType() ->AnimationType {
        if values != nil && values!.count > 0 &&
           keyTimes != nil && keyTimes!.count > 0 &&
           values!.count == keyTimes!.count{
            
            return AnimationType.Keyframe
        }else if fromValue != nil || toValue != nil || byValue != nil {
            
            return AnimationType.Basic
        }else {
            
            return AnimationType.Invalid
        }
    }
}
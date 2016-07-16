//
//  HKCustomOperators.swift
//  HKAnimation
//
//  Created by heke on 16/7/12.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation

/**
 operator:
 prefix
 infix
 postfix
 
 associativity:
 The possible values for associativity are left, right, and none.
 
 precedence:
 
 https://developer.apple.com/library/ios/documentation/Swift/Reference/Swift_StandardLibrary_Operators/index.html#//apple_ref/doc/uid/TP40016054
 
 */

infix operator ⋅ {
    associativity none
    precedence 160
}

func ⋅ (a: Int, b: Int) ->Int{
    return a + b
}

func test() {
    let a = 0
    let b = 0
    
    a ⋅ b
}


infix operator &+ {
    associativity none
    precedence 160
}

func &+ (a: Int, b: Int) ->Int{
    addValues(100, b: 100)
    return a + b
}

func addValues<T>(a: T, b: T) {
    print("\(a) \(b)")
}

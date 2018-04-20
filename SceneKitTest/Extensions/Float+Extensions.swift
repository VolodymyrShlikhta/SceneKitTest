//
//  Float+Extensions.swift
//  SceneKitTest
//
//  Created by Volodymyr Shlikhta on 20/4/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation

public extension Float {
    public static func random(min: Float, max: Float) -> Float {
        let r32 = Float(arc4random()) / Float(UInt32.max)
        return (r32 * (max - min)) + min
    }
}

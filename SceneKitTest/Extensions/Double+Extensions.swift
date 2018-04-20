//
//  Double+Extensions.swift
//  SceneKitTest
//
//  Created by Volodymyr Shlikhta on 20/4/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation

public extension Double {
    public static func random(min: Double, max: Double) -> Double {
        let r64 = Double(arc4random()) / Double(UInt64.max)
        return (r64 * (max - min)) + min
    }
}


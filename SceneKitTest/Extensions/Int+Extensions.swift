//
//  Int+Extensions.swift
//  SceneKitTest
//
//  Created by Volodymyr Shlikhta on 20/4/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation

public extension Int {
    public static func random(min: Int , max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(min - max + 1))) + min
    }
}

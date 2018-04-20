//
//  Shape.swift
//  SceneKitTest
//
//  Created by Volodymyr Shlikhta on 20/4/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import Foundation
import SceneKit

fileprivate let base: CGFloat = 0.7

enum Shape: Int {
    case cube = 0
    case torus = 1
    case cylinder = 2
    case capsule = 3
    case pyramid = 4
    case sphere = 5
    case cone = 6
    case tube = 7
    
    static func random() -> Shape {
        let maxValue = tube.rawValue
        let rand = arc4random_uniform(UInt32(maxValue+1))
        return Shape(rawValue: Int(rand))!
    }
    
    func getForm() -> SCNGeometry {
        switch self {
        case .capsule:
            return SCNCapsule(capRadius: base, height: base)
        case .cone:
            return SCNCone(topRadius: base, bottomRadius: base, height: base)
        case .cube:
            return SCNBox(width: base, height: base, length: base, chamferRadius: 0.0)
        case .cylinder:
            return SCNCylinder(radius: base, height: base)
        case .pyramid:
            return SCNPyramid(width: base, height: base, length: base)
        case .sphere:
            return SCNSphere(radius: base)
        case .torus:
            return SCNTorus(ringRadius: base, pipeRadius: base / 2.0)
        case .tube:
            return SCNTube(innerRadius: base / 2.0, outerRadius: base, height: base)
        }
    
    }
}

//
//  SCNAction+Extensions.swift
//  SceneKitTest
//
//  Created by Volodymyr Shlikhta on 20/4/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import SceneKit
import Foundation

extension SCNAction {
    
    class func waitForDurationThenRemoveFromParent(duration:TimeInterval) -> SCNAction {
        let wait = SCNAction.wait(duration: duration)
        let remove = SCNAction.removeFromParentNode()
        return SCNAction.sequence([wait,remove])
    }
    
    class func waitForDurationThenRunBlock(duration:TimeInterval, block: @escaping ((SCNNode?) -> Void) ) -> SCNAction {
        let wait = SCNAction.wait(duration: duration)
        let runBlock = SCNAction.run { (node) -> Void in
            block(node)
        }
        return SCNAction.sequence([wait,runBlock])
    }
    
    class func rotateByXForever(x:CGFloat, y:CGFloat, z:CGFloat, duration:TimeInterval) -> SCNAction {
        let rotate = SCNAction.rotateBy(x: x,
                                        y: y,
                                        z: z,
                                        duration: duration)
        return SCNAction.repeatForever(rotate)
    }
    
}

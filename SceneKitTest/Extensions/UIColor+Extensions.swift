//
//  UIColor+Extensions.swift
//  SceneKitTest
//
//  Created by Volodymyr Shlikhta on 20/4/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import SceneKit
let UIColorList: [UIColor] = [
    UIColor.black,
    UIColor.white,
    UIColor.red,
    UIColor.limeColor(),
    UIColor.blue,
    UIColor.yellow,
    UIColor.cyan,
    UIColor.silverColor(),
    UIColor.gray,
    UIColor.maroonColor(),
    UIColor.oliveColor(),
    UIColor.brown,
    UIColor.green,
    UIColor.lightGray,
    UIColor.magenta,
    UIColor.orange,
    UIColor.purple,
    UIColor.tealColor()
]
extension UIColor {
    
    
    
    static func random() -> UIColor {
        let maxValue = UIColorList.count
        let rand = Int(arc4random_uniform(UInt32(maxValue)))
        return UIColorList[rand]
    }
    
    static func limeColor() -> UIColor {
        return UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    }
    
    public static func silverColor() -> UIColor {
        return UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0)
    }
    
    public static func maroonColor() -> UIColor {
        return UIColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    
    public static func oliveColor() -> UIColor {
        return UIColor(red: 0.5, green: 0.5, blue: 0.0, alpha: 1.0)
    }
    
    public static func tealColor() -> UIColor {
        return UIColor(red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0)
    }
    
    public static func navyColor() -> UIColor {
        return UIColor(red: 0.0, green: 0.0, blue: 128, alpha: 1.0)
    }
}



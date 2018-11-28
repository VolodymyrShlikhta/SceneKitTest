//
//  UIColor+Extensions.swift
//  SceneKitTest
//
//  Created by Volodymyr Shlikhta on 20/4/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import SceneKit
let UIColorList: [UIColor] = [
    .black,
    .white,
    .red,
    .lime,
    .blue,
    .yellow,
    .cyan,
    .silver,
    .gray,
    .maroon,
    .olive,
    .brown,
    .green,
    .lightGray,
    .magenta,
    .orange,
    .purple,
    .teal
]
extension UIColor {

    static func random() -> UIColor {
        let maxValue = UIColorList.count
        let rand = Int(arc4random_uniform(UInt32(maxValue)))
        return UIColorList[rand]
    }

    public static let lime = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    public static let silver = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0)
    public static let maroon = UIColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0)
    public static let olive = UIColor(red: 0.5, green: 0.5, blue: 0.0, alpha: 1.0)
    public static let teal = UIColor(red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0)
    public static let navy = UIColor(red: 0.0, green: 0.0, blue: 128, alpha: 1.0)
}



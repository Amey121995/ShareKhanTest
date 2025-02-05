//
//  UIColorExtension.swift
//  ShareKhanTestProject
//
//  Created by Amey Dalvi on 27/05/24.
//

import Foundation
import UIKit

extension UIColor{
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
    
    static func primaryColor() -> UIColor{
        return UIColor(hex: "#DBC94A") ?? .clear
    }
    
    static func secondaryColor() -> UIColor{
        return UIColor(hex: "818285")  ?? .clear
    }
    
    static func textColor1() -> UIColor{
        return UIColor.black
    }
    
    static func textColor2() -> UIColor{
        return UIColor(hex: "818285")  ?? .clear
    }
    
    static func textGreenColor() -> UIColor{
        return UIColor(hex: "5CA681")  ?? .clear
    }
}

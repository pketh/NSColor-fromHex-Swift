//
//  NSColor+hex.swift
//
//  Created by Pirijan on 2014-07-08.
//
//

import Cocoa

extension NSColor {
    class func hex(hexColor: String) -> NSColor {
        var hex = String()
        if hexColor.hasPrefix("#") {
            hex = hexColor.substringFromIndex(1)
        } else {
            hex = hexColor
        }

        func hexToCGFloat(color: String) -> CGFloat {
            var result: CUnsignedInt = 0
            var scanner: NSScanner = NSScanner.scannerWithString(color)
            scanner.scanHexInt(&result)
            var colorValue: CGFloat = CGFloat(result)
            return colorValue / 255
        }

        let redComponent = hexToCGFloat(hex.substringToIndex(2)),
        greenComponent = hexToCGFloat(hex.substringFromIndex(2).substringToIndex(2)),
        blueComponent = hexToCGFloat(hex.substringFromIndex(4).substringToIndex(2))

        let color = NSColor(calibratedRed: redComponent, green: greenComponent, blue: blueComponent, alpha: 1)

        return color
    }
}

//
//  NSColor+hex.swift
//  Tello
//
//  Created by Pirijan on 2014-07-08.
//  Copyright (c) 2014 pketh. All rights reserved.
//
//  ♥︎ https://github.com/pketh/NSColor-hex-Swift
//


import Cocoa

extension NSColor {
    class func fromHex(hexColor: String) -> NSColor {
        var hex = String()
        if hexColor.hasPrefix("#") {
            hex = hexColor[1]
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

        let redComponent = hexToCGFloat(hex[0...1]),
        greenComponent = hexToCGFloat(hex[2...3]),
        blueComponent = hexToCGFloat(hex[4...5])

        let color = NSColor(calibratedRed: redComponent, green: greenComponent, blue: blueComponent, alpha: 1)

        return color
    }
}

extension String {
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
    subscript (r: Range<Int>) -> String {
        var start = advance(startIndex, r.startIndex)
            var end = advance(startIndex, r.endIndex)
            return substringWithRange(Range(start: start, end: end))
    }
}


// ## sample usage
// var hexColor = "#259B9A"
// NSColor.fromHex(hexColor)
// returns an NSColor object:
// `NSColor(calibratedRed: 0.8, green: 0.322, blue: 0.322, alpha: 1)`
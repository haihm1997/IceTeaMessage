//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

// swiftlint:disable identifier_name
extension CGRect {
    
    var x: CGFloat {
        get {
            return self.origin.x
        }
        set {
            var rect = self
            rect.origin.x = newValue
            self = rect
        }
    }
    
    var y: CGFloat {
        get {
            return self.origin.y
        }
        set {
            var rect = self
            rect.origin.y = newValue
            self = rect
        }
    }
    
    public static func * (rect: CGRect, scalar: CGFloat) -> CGRect {
        return CGRect(x: rect.x * scalar, y: rect.y * scalar, width: rect.width * scalar, height: rect.height * scalar)
    }
}

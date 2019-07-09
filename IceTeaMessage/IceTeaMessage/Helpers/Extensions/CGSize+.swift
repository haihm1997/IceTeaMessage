//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

extension CGSize {
    
    var ratio: CGFloat {
        return self.width / self.height
    }
    
    var reverse: CGSize {
        return CGSize(width: self.height, height: self.width)
    }
    
    public static func * (size: CGSize, scalar: CGFloat) -> CGSize {
        return CGSize(width: size.width * scalar, height: size.height * scalar)
    }
}

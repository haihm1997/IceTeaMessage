//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

extension Dictionary {
    
    var prettyPrint: String {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            let string = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            return string ?? ""
        } catch {
            return ""
        }
    }
}

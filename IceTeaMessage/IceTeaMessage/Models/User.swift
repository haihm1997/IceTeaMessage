//
//  User.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/11/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var id = ""
    var avatar = ""
    var name = ""
    var lastMessage = ""
    
    init(id: String, avatar: String, name: String, lastMessage: String) {
        self.id = id
        self.avatar = avatar
        self.name = name
        self.lastMessage = lastMessage
    }
    
}

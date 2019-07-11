//
//  Message.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/9/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit

class Message: NSObject {
    
    var avatar = ""
    var content = ""
    var isReceiver = false
    var image = ""
    var isImageMessage = false
    
    
    init(avatar: String, content: String, isReceiver: Bool = false) {
        self.avatar = avatar
        self.content = content
        self.isReceiver = isReceiver
    }
    
    init(avatar: String, image: String, isReceiver: Bool = false) {
        self.avatar = avatar
        self.image = image
        self.isImageMessage = true
        self.isReceiver = isReceiver
    }
    
}


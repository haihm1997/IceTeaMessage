//
//  Message.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/9/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit
import FirebaseDatabase

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
    
    init(snap: DataSnapshot) {
        let messageDict = snap.value as? [String: Any] ?? [:]
        self.avatar = messageDict["avatar"] as? String ?? ""
        self.content = messageDict["content"] as? String ?? ""
        self.image = messageDict["image"] as? String ?? ""
        let senderUser = messageDict["sendedUser"] as? String ?? ""
        self.isReceiver = senderUser != Constants.Shared.savedUser.id
        self.isImageMessage = !self.image.isEmpty
    }
    
}

extension Message {
    
    var representData: [String: Any] {
        let data: [String: Any] = [
            "avatar": Constants.Shared.savedUser.avatar,
            "content": content,
            "image": image,
            "sendedUser": Constants.Shared.savedUser.id
        ]
        
        return data
    }
    
}


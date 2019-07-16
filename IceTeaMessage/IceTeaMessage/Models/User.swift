//
//  User.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/11/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import Foundation
import FirebaseDatabase

class User: NSObject, Codable {
    
    var id = ""
    var avatar = ""
    var name = ""
    var lastMessage = ""
    var chatedRooms: [String] = [String]()
    
    override init() {
        super.init()
    }
    
    init(id: String, avatar: String, name: String, lastMessage: String) {
        self.id = id
        self.avatar = avatar
        self.name = name
        self.lastMessage = lastMessage
    }
    
    init(snapshot: DataSnapshot) {
        let userDict = snapshot.value as? [String: Any] ?? [:]
        self.id = userDict["id"] as? String ?? ""
        self.avatar = userDict["avatar"] as? String ?? ""
        print("user avatar: \(self.avatar)")
        self.name = userDict["name"] as? String ?? ""
        //self.lastMessage = userDict["lastMessage"] as? String ?? ""
        self.lastMessage = "last message"
    }
    
}

extension User {
    
    var representationData: [String: Any] {
        let data: [String: Any] = [
            "id": id,
            "avatar": avatar,
            "name": name,
            "lastMessage": lastMessage
        ]
        return data
    }
    
}

//
//  DetailMessageViewModel.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/9/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DetailMessageViewModel: NSObject {
    
    var choosedUser = User()
    let ref = Database.database().reference().child(Constants.FBKey.channels)
    var correctRoomId = ""
    
//    var messages: [Message] = [ Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform."),
//                                Message(avatar: "avatar", content: "Welcome to theSwift community.", isReceiver: true),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone."),
//                                Message(avatar: "avatar", content: "Welcome to the Swift"),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build.", isReceiver: true),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform.", isReceiver: true),
//                                Message(avatar: "avatar", image: "nature1", isReceiver: true),
//                                Message(avatar: "avatar", image: "nature2"),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform."),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: true),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: true),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: false),
//                                Message(avatar: "avatar", image: "nature1", isReceiver: true),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: true),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: false),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: true),
//                                Message(avatar: "avatar", image: "nature2"),
//                                Message(avatar: "avatar", image: "nature2"),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform.", isReceiver: true),
//                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform.", isReceiver: false)
//
//                              ]
    var messages: [Message] = [Message]()
    
    func sendMessage(message: Message) {
        ref.child(correctRoomId).childByAutoId().setValue(message.representData)
    }
    
    func getRoomId(completed: @escaping () -> ()) {
        let roomId = choosedUser.id + Constants.Shared.savedUser.id
        let reverseRoomId = Constants.Shared.savedUser.id + choosedUser.id
        ref.observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.hasChild(roomId) {
                self.correctRoomId = roomId
            } else {
                self.correctRoomId = reverseRoomId
            }
            completed()
        }
    }
    
    func getAllOldMessage(completed: @escaping () -> ()) {
        ref.child(correctRoomId).observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children {
                if let snap = child as? DataSnapshot {
                    let message = Message(snap: snap)
                    self.messages.append(message)
                }
            }
            completed()
        }
    }
    
    func observeMessage(completed: @escaping () -> ()) {
        ref.child(correctRoomId).observe(.childAdded) { (snapshot) in
            let message = Message(snap: snapshot)
            self.messages.append(message)
            completed()
        }
    }
    
    func removeObserver() {
        ref.removeAllObservers()
    }
    
}

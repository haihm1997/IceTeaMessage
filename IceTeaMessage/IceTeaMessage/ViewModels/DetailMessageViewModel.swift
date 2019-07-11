//
//  DetailMessageViewModel.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/9/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit

class DetailMessageViewModel: NSObject {
    
    var messages: [Message] = [ Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform."),
                                Message(avatar: "avatar", content: "Welcome to theSwift community.", isReceiver: true),
                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone."),
                                Message(avatar: "avatar", content: "Welcome to the Swift"),
                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build.", isReceiver: true),
                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform.", isReceiver: true),
                                Message(avatar: "avatar", image: "nature1", isReceiver: true),
                                Message(avatar: "avatar", image: "nature2"),
                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform."),
                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: true),
                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: true),
                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: false),
                                Message(avatar: "avatar", image: "nature1", isReceiver: true),
                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: true),
                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: false),
                                Message(avatar: "avatar", content: "Welcome to the Swift community.", isReceiver: true),
                                Message(avatar: "avatar", image: "nature2"),
                                Message(avatar: "avatar", image: "nature2"),
                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform.", isReceiver: true),
                                Message(avatar: "avatar", content: "Welcome to the Swift community. Together we are working to build a programming language to empower everyone to turn their ideas into apps on any platform.", isReceiver: false)
        
                              ]
    
}

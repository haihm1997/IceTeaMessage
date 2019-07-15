//
//  Constants.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/15/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Shared {
        static var savedUser = User()
    }
    
    struct FBKey {
        static let usersKey = "Users"
    }
    
}

extension Constants {
    
    static func loadShared() {
        Constants.Shared.savedUser = UserDefaults.standard.retrieve(object: User.self, fromKey: UserDefaults.DefaultKey.userInfo) ?? User()
    }
    
}

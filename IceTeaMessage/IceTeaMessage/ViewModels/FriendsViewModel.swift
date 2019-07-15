//
//  FriendsViewModel.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/15/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FriendsViewModel: NSObject {
    
    var friendList: [User] = [User]()
    
    func observeUsersDatabase(completed: @escaping () -> ()) {
        let ref = Database.database().reference()
        ref.child(Constants.FBKey.usersKey).observe(DataEventType.value, with: { (snapshot) in
            for child in snapshot.children {
                if let snap = child as? DataSnapshot {
                    let user = User(snapshot: snap)
                    if user.id != Constants.Shared.savedUser.id {
                        self.friendList.append(user)
                    }
                }
            }
            completed()
        })
    }
    
}

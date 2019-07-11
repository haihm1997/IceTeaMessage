//
//  TempImageMess.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/10/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit

class TempImageMess: Message {
    
    var tempImage = UIImage()
    
    init(avatar: String, tempImage: UIImage, isReceiver: Bool = false) {
        super.init(avatar: avatar, image: "", isReceiver: isReceiver)
        self.tempImage = tempImage
    }
    
}

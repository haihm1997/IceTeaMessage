//
//  ImageMessCell.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/9/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit

class ImageMessCell: UITableViewCell {
    
    @IBOutlet weak var receiverAvatar: UIImageView!
    @IBOutlet weak var senderAvatar: UIImageView!
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var senderImage: UIImageView!
    
    static let identifier = "ImageMessCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configView(message: Message) {
        receiverAvatar.isHidden = !message.isReceiver
        senderAvatar.isHidden = message.isReceiver
        receiverImage.isHidden = !message.isReceiver
        senderImage.isHidden = message.isReceiver
        if message.isReceiver {
            receiverAvatar.imageFromServerURL(message.avatar, placeHolder: UIImage(named: "avatar"))
            receiverImage.imageFromServerURL(message.image, placeHolder: UIImage(named: "avatar"))
        } else {
            senderAvatar.imageFromServerURL(message.avatar, placeHolder: UIImage(named: "avatar"))
            senderImage.imageFromServerURL(message.image, placeHolder: UIImage(named: "avatar"))
        }
    }
    
    func configTempImageMess(message: TempImageMess) {
        receiverAvatar.isHidden = true
        receiverImage.isHidden = true
        senderImage.isHidden = false
        senderAvatar.isHidden = false
        senderAvatar.image = UIImage(named: message.avatar)
        senderImage.image = message.tempImage
    }
    
}

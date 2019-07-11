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
            receiverAvatar.image = UIImage(named: message.avatar)
            receiverImage.image = UIImage(named: message.image)
        } else {
            senderAvatar.image = UIImage(named: message.avatar)
            senderImage.image = UIImage(named: message.image)
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

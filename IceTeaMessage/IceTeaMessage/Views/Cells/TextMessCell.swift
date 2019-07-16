//
//  TextMessCell.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/9/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit

class TextMessCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var avatarReceiverImage: UIImageView!
    @IBOutlet weak var avatarSenderImage: UIImageView!
    
    static let identifier = "TextMessCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentLabel.layer.masksToBounds = true
        contentLabel.layer.cornerRadius = 10
    }
    
    func configCell(message: Message) {
        contentLabel.text = message.content
        avatarSenderImage.isHidden = message.isReceiver
        avatarReceiverImage.isHidden = !message.isReceiver
        if message.isReceiver {
            avatarReceiverImage.imageFromServerURL(message.avatar, placeHolder: UIImage(named: "avatar"))
        } else {
            avatarSenderImage.imageFromServerURL(message.avatar, placeHolder: UIImage(named: "avatar"))
        }
       
    }

}

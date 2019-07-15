//
//  UserItemCell.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/15/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit
import AlamofireImage

class UserItemCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    static let identifier = "UserItemCell"
    var didTapCell: ((_ indexPath: IndexPath) -> Void)?
    var indexPath = IndexPath(row: 0, section: 0)
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configCell(user: User, indexPath: IndexPath) {
        self.indexPath = indexPath
        avatar.imageFromServerURL(user.avatar, placeHolder: UIImage(named: "avatar"))
        nameLabel.text = user.name
        lastMessageLabel.text = user.lastMessage
    }
    
    @IBAction func cellButtonTapped(_ sender: Any) {
        didTapCell?(indexPath)
    }

}

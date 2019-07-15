//
//  ViewController.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/8/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeVC: BaseVC {
    
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentUser = Auth.auth().currentUser {
            userIdLabel.text = currentUser.uid
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func nextScreenTapped(_ sender: Any) {
        let detailMessageVC = self.instantiateViewController(fromStoryboard: .main, ofType: DetailMessageVC.self)
        self.navigationController?.pushViewController(detailMessageVC, animated: true)
    }
    
}


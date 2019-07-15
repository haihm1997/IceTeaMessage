//
//  SettingVC.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/11/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let loginVC = self.instantiateViewController(fromStoryboard: .main, ofType: LoginVC.self)
            UIApplication.shared.windows.first?.rootViewController = loginVC
        } catch {
            CustomDialog.shared.showSimpleAlert(message: "Unknow Error!")
        }
    }

}

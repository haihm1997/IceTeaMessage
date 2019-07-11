//
//  LoginVC.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/10/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBAction func facebookLogin(sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            Auth.auth().signInAndRetrieveData(with: credential, completion: { (authData, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okeyAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okeyAction)
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                
                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") {
                    let nav = UINavigationController(rootViewController: viewController)
                    UIApplication.shared.keyWindow?.rootViewController = nav
                    self.dismiss(animated: true, completion: nil)
                }
            })

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension LoginVC {

}

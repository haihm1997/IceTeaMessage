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
import FirebaseDatabase

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func facebookLogin(sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            self.showLoading()
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
                
                self.getUserInfor()
            })

        }
    }
    
    func getUserInfor() {
        if FBSDKAccessToken.current() != nil {
            let token = FBSDKAccessToken.current()?.tokenString
            let request = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: token, version: nil, httpMethod: "GET")
            
            request?.start(completionHandler: { (test, result, error) in
                self.dismissLoading()
                if(error == nil)
                {
                    guard let data = result as? [String: Any] else {
                        return
                    }
                    self.loadUserInfo(data)
                }
                self.openMainScreen()
            })
        }
    }
    
    private func loadUserInfo(_ data: [String: Any]) {
        let fbId  = data["id"] as? String ?? ""
        let name = data["name"] as? String ?? ""
        let avatarUrl = "http://graph.facebook.com/\(fbId)/picture?type=large"
        let authId = Auth.auth().currentUser?.uid
        let user = User(id: authId ?? "", avatar: avatarUrl, name: name, lastMessage: "")
        UserDefaults.standard.save(customObject: user, inKey: UserDefaults.DefaultKey.userInfo)
        pushUserInfor(user: user)
    }
    
    private func pushUserInfor(user: User) {
        let ref = Database.database().reference()
        ref.child(Constants.FBKey.usersKey).child(user.id).setValue(user.representationData)
    }
    
    private func openMainScreen() {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") {
            UIApplication.shared.keyWindow?.rootViewController = viewController
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension LoginVC {

}

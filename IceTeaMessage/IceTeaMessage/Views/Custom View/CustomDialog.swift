//
//  CustomDialog.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/11/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit

class CustomDialog: NSObject {
   
    var rootWindow: UIWindow!

    static let shared = CustomDialog()
    
    private override init() {
        super.init()
        
    }
    
    func showSimpleAlert(title: String = "Ice Tea Message", message: String) {
        let customWindow = UIWindow(frame: UIScreen.main.bounds)
        customWindow.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        customWindow.rootViewController = UIViewController()
        CustomDialog.shared.rootWindow = UIApplication.shared.windows.first
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
            DispatchQueue.main.async {
                self.onDissmisDialog(alert: alert, customWindow: customWindow)
            }
        })
        alert.addAction(okAction)
        
        makeShowCustomDialog(alert: alert, customWindow: customWindow)
    }
    
    func showAlertWithTwoOption(title: String = "Ice Tea Message", message: String, onCompleted: @escaping () -> ()) {
        let customWindow = UIWindow(frame: UIScreen.main.bounds)
        customWindow.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        customWindow.rootViewController = UIViewController()
        CustomDialog.shared.rootWindow = UIApplication.shared.windows.first
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
            DispatchQueue.main.async {
                self.onDissmisDialog(alert: alert, customWindow: customWindow)
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            DispatchQueue.main.async {
                self.onDissmisDialog(alert: alert, customWindow: customWindow)
            }
            onCompleted()
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        makeShowCustomDialog(alert: alert, customWindow: customWindow)
    }

    func onDissmisDialog(alert: UIAlertController, customWindow: UIWindow) {
        alert.dismiss(animated: false, completion: nil)
        customWindow.isHidden = true
        customWindow.removeFromSuperview()
        CustomDialog.shared.rootWindow.makeKeyAndVisible()
    }
    
    func makeShowCustomDialog(alert: UIAlertController, customWindow: UIWindow) {
        customWindow.windowLevel = UIWindow.Level.alert
        customWindow.makeKeyAndVisible()
        customWindow.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
}

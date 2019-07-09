//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import SVProgressHUD

enum StoryboardName: String {
    case authen = "Authen"
    case home = "Home"
    case listPhoto = "ListPhoto"
    case alert = "CQAlert"
    case tabbar = "Tabbar"
    case tester = "Tester"
    case kokuban = "Kokuban"
    case approver = "Approver"
    case camera = "Camera"
}

extension UIViewController {
    
    func showLoading(message: String = "", isShowMask: Bool = false) {
        if isShowMask {
            SVProgressHUD.setDefaultMaskType(.clear)
        }
        if !message.isEmpty {
            SVProgressHUD.show(withStatus: message)
        } else {
            SVProgressHUD.show()
        }
    }
    
    @objc func dismissLoading() {
        SVProgressHUD.dismiss()
    }
}

extension UIViewController {
    
    func topController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController {
        if let navigationController = controller as? UINavigationController {
            return topController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topController(controller: presented)
        }
        return controller ?? UIViewController()
    }
}

extension UIViewController {
    
    func instantiateViewController<T>(fromStoryboard name: StoryboardName, ofType type: T.Type) -> T {
        return storyboard(name: name).instantiateViewController(ofType: type)
    }
    
    func storyboard(name: StoryboardName) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue, bundle: nil)
    }

}

extension UIViewController {
    var isModal: Bool {
        return presentingViewController != nil ||
            navigationController?.presentingViewController?.presentedViewController === navigationController ||
            tabBarController?.presentingViewController is UITabBarController
    }
}

extension UIViewController {
    
    func instanceInNavigation<T>(ofType type: T.Type) -> T? {
        guard let viewControllers = navigationController?.viewControllers.reversed() else { return nil }
        for item in viewControllers {
            if let visibleVC = item as? T {
                return visibleVC
            }
        }
        return nil
    }
}

extension UIViewController {
    func forceToOrientation(_ orientation: UIInterfaceOrientation) {
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
}

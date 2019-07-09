//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit
import ObjectiveC

var CQRefreshControlView: UInt8 = 0

extension UIScrollView {
    
    var pullToRefreshControl: CQRefreshControl? {
        get {
            return objc_getAssociatedObject(self, &CQRefreshControlView) as? CQRefreshControl
        }
        set {
            objc_setAssociatedObject(self, &CQRefreshControlView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc func addPullToRefreshWithActionHandler(_ actionHandle: @escaping () -> Void) {
        let refreshControl = CQRefreshControl()
        refreshControl.valueChangeActionHandle = actionHandle
        self.addSubview(refreshControl)
        self.pullToRefreshControl = refreshControl
    }
    
    func triggerPullToRefresh() {
        self.pullToRefreshControl?.beginRefreshing()
        self.pullToRefreshControl?.refreshControlValueChanged()
    }
    
    func stopPullToRefreshAnimating() {
        self.pullToRefreshControl?.endRefreshing()
    }
}

class CQRefreshControl: UIRefreshControl {
    
    var valueChangeActionHandle: (() -> Void)?
    
    override init() {
        super.init()
        self.addTarget(self, action: #selector(refreshControlValueChanged), for: UIControl.Event.valueChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func refreshControlValueChanged() {
        self.beginRefreshing()
        valueChangeActionHandle?()
    }
}

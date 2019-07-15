//
//  FriendsVC.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/14/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit

class FriendsVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FriendsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        viewModel.observeUsersDatabase {
            self.tableView.reloadData()
        }
    }
    
    private func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: UserItemCell.identifier, bundle: nil), forCellReuseIdentifier: UserItemCell.identifier)
        tableView.rowHeight = 70
    }
    
}

extension FriendsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: UserItemCell.self, for: indexPath)
        let user = viewModel.friendList[indexPath.row]
        cell?.configCell(user: user, indexPath: indexPath)
        cell?.didTapCell = { [weak self] indexPath in
            guard let weakSelf = self else {
                return
            }
            let user = self?.viewModel.friendList[indexPath.row]
            
        }
        return cell ?? UITableViewCell()
    }
}

extension FriendsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

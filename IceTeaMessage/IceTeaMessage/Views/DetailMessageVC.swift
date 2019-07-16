//
//  DetailMessageVC.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/9/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit
import Photos
import BSImagePicker


class DetailMessageVC: BaseVC {
    
    @IBOutlet weak var typingSpaceBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendTextFeild: UITextField!
    
    var photos = [UIImage]()
    let viewModel = DetailMessageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getRoomId {
            self.viewModel.observeMessage {
                let indexPath = [IndexPath(row: self.viewModel.messages.count - 1, section: 0)]
                self.tableView.insertRows(at: indexPath, with: UITableView.RowAnimation.automatic)
                self.scrollToLastMessage()
            }
        }
        configTableView()
    }
    
    deinit {
        viewModel.removeObserver()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: TextMessCell.identifier, bundle: nil),
                           forCellReuseIdentifier: TextMessCell.identifier)
        tableView.register(UINib(nibName: ImageMessCell.identifier, bundle: nil), forCellReuseIdentifier: ImageMessCell.identifier)
        
    }
    
    override func keyBoardShowing(keyboardHeight: CGFloat) {
        super.keyBoardShowing(keyboardHeight: keyboardHeight)
        typingSpaceBottomConstraint.constant = keyboardHeight
    }
    
    override func keyboardHiding() {
        super.keyboardHiding()
        typingSpaceBottomConstraint.constant = 0
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        let sendContent = sendTextFeild.text ?? ""
        if !sendContent.isEmpty {
            let sendMessage = Message(avatar: "avatar", content: sendContent)
            viewModel.sendMessage(message: sendMessage)
            sendTextFeild.text = ""
            tableView.reloadData()
            scrollToLastMessage()
        }
    }
    
    func scrollToLastMessage() {
        let indexPath = IndexPath(item: viewModel.messages.count - 1, section: 0)
        if viewModel.messages.count > 2 {
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    @IBAction func takePhotoButtonTapped(_ sender: Any) {
        openImagePickerVC()
    }
    
    func openImagePickerVC() {
        let vc = BSImagePickerViewController()
        
        self.bs_presentImagePickerController(vc,
                                             animated: true,
                                             select: { (asset: PHAsset) -> Void in },
                                             deselect: { (asset: PHAsset) -> Void in },
                                             cancel: { (assets: [PHAsset]) -> Void in },
                                             finish: { (assets: [PHAsset]) -> Void in
                                                Utility.convertAssetToImages(assets: assets, completed: ({ images in
                                                    self.updateImageToConversation(images: images)
                                                }))
                                            },completion: nil)
    }
    
    func updateImageToConversation(images: [UIImage]) {
        for item in images {
            let tempImageMess = TempImageMess(avatar: "avatar", tempImage: item)
            viewModel.messages.append(tempImageMess)
        }
        tableView.reloadData()
        scrollToLastMessage()
    }

}

extension DetailMessageVC: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0 {
            dismissKeyboard()
        }
    }
    
}

extension DetailMessageVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let message = viewModel.messages[indexPath.row]
        return message.isImageMessage ? 250 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = viewModel.messages[indexPath.row]
        if message.isImageMessage {
            return setupImageMessCell(indexPath: indexPath, message: message)
        } else {
            return setupTextOnlyCell(indexPath: indexPath, message: message)
        }
    }
    
    private func setupTextOnlyCell(indexPath: IndexPath, message: Message) -> UITableViewCell {
        let textMessCell = tableView.dequeueReusableCell(ofType: TextMessCell.self, for: indexPath)
        textMessCell?.configCell(message: message)
        return textMessCell ?? UITableViewCell()
    }
    
    private func setupImageMessCell(indexPath: IndexPath, message: Message) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ImageMessCell.self, for: indexPath)
        if message is TempImageMess {
            cell?.configTempImageMess(message: message as? TempImageMess ?? TempImageMess(avatar: "", tempImage: UIImage()))
        } else {
            cell?.configView(message: message)
        }
        
        return cell ?? UITableViewCell()
    }

}

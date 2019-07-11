//
//  Utility.swift
//  IceTeaMessage
//
//  Created by Hoàng Hải on 7/9/19.
//  Copyright © 2019 HoangHai. All rights reserved.
//

import UIKit
import Photos

class Utility: NSObject {
    
    static func convertAssetToImages(assets: [PHAsset], completed: @escaping (_ images: [UIImage]) -> ()) {
        var tempImages = [UIImage]()
        for i in 0..<assets.count {
            let manager = PHImageManager.default()
            let option = PHImageRequestOptions()
            var thumnail = UIImage()
            option.isSynchronous = true
            
            manager.requestImage(for: assets[i], targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFit, options: option) { (result, infor) -> Void in
                thumnail = result ?? UIImage()
            }
            
            let data = thumnail.jpegData(compressionQuality: 0.5)
            let newImage = UIImage(data: data!)
            
            tempImages.append(newImage ?? UIImage())
        }
        
        completed(tempImages)
    }
    
}

//
//  Constants.swift
//  ProjectBase
//
//  Created by Hoàng Hải on 10/16/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T>(ofType type: T.Type, for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as? T
    }
    
    func selectAll(animated: Bool) {
        (0..<numberOfSections).compactMap { (section) -> [IndexPath]? in
            return (0..<numberOfItems(inSection: section)).compactMap({ (item) -> IndexPath? in
                return IndexPath(item: item, section: section)
            })
            }.flatMap { $0 }.forEach { (indexPath) in
                selectItem(at: indexPath, animated: true, scrollPosition: [])
        }
    }
    /// Deselects all selected cells.
    func deselectAll(animated: Bool) {
        indexPathsForSelectedItems?.forEach({ (indexPath) in
            deselectItem(at: indexPath, animated: animated)
        })
    }
}

//
//  UITableView+UICollectionView.swift
//  orange_wallpaper
//
//  Created by Rizabek on 12.12.2020.
//

//import UIKit
//
//protocol ReusableView: class {
//    static var identifier: String { get }
//}
//
//class UITableViewCellWithIdentifire: UITableViewCell {
//    static var nib:UINib {
//        return UINib(nibName: identifier, bundle: nil)
//    }
//
//    static var identifier: String {
//        return String(describing: self)
//    }
//}
//
//class UICollectionViewCellWithIdentifire: UICollectionViewCell {
//    static var nib:UINib {
//        return UINib(nibName: identifier, bundle: nil)
//    }
//
//    static var identifier: String {
//        return String(describing: self)
//    }
//}
//
//extension ReusableView where Self: UIView {
//    static var identifier: String {
//      return (NSStringFromClass(self) as NSString).lastPathComponent.components(separatedBy: ".").last!
//    }
//}
//
//extension UICollectionViewCell: ReusableView {
//}
//
//extension UITableViewCell: ReusableView {
//}


import UIKit

extension UICollectionView {
    
    func register(cellTypes: [UICollectionViewCell.Type]) {
        
        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
}

extension UITableView {
    
    func register(cellTypes: [UITableViewCell.Type]) {
        
        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellReuseIdentifier: reuseIdentifier)
        }
    }
}

protocol ReusableView: class {
    static var identifier: String { get }
}

class UITableViewCellWithIdentifire: UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

class UICollectionViewCellWithIdentifire: UICollectionViewCell {
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension ReusableView where Self: UIView {
    static var identifier: String {
        return (NSStringFromClass(self) as NSString).lastPathComponent.components(separatedBy: ".").last!
    }
}

extension UICollectionViewCell: ReusableView {
}

extension UITableViewCell: ReusableView {
}



extension UICollectionView {
  
  func deselectAllItems(animated: Bool) {
    guard let selectedItems = indexPathsForSelectedItems else { return }
    for indexPath in selectedItems { deselectItem(at: indexPath, animated: animated) }
  }
}

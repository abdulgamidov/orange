//
//  AlertPresentable.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit

protocol AlertPresentable: class {
    func showAlert(title: String?, message: String?, actions: [AlertAction], style: UIAlertController.Style)
}

extension AlertPresentable where Self: UIViewController {

    func showAlert(title: String?, message: String?, actions: [AlertAction], style: UIAlertController.Style) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let alertActions = actions.map { (action) in
            return UIAlertAction(title: action.title, style: action.style, handler: { (_) in
                action.action?()
            })
        }
        
        alertActions.forEach {
            alert.addAction($0)
        }
        
        present(alert, animated: true, completion: nil)
    }
}

let AlertCancelAction = AlertAction(title: "Cancel", style: .cancel, action: nil)

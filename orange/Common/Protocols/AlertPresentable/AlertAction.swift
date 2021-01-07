//
//  AlertAction.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let action: (() -> Void)?
}

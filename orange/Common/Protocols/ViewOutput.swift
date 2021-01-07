//
//  ViewOutput.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import Foundation

protocol ViewOutput: AnyObject {
    func viewIsReady()
    func viewWillAppear()
    func viewWillDisappear()
    func deInit()
    func didTapDismissButton()
    func viewWillDeinit()
}

extension ViewOutput {
    
    // MARK: - Default implementation
    
    func viewIsReady() { }
    func viewWillAppear() { }
    func viewWillDisappear() { }
    func deInit() { }
    func didTapDismissButton() { }
    func viewWillDeinit() { }
}

//
//  SplashViewController.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import UIKit
import SnapKit

protocol SplashViewInput:  AlertPresentable, Loadable {}

final class SplashViewController: UIViewController, SplashViewInput {
  
  // MARK: - Properties
  
  var presenter: SplashViewOutput?
  private var didSetupConstraints = false
  
  private let splashImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "splashImage")
    return imageView
  }()
  
  // MARK: - LIVE CIRCLE
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addSubViews()
    presenter?.viewIsReady()
  }
  
  // MARK: - SET UI
  private func addSubViews() {
    view.addSubview(splashImage)
    view.setNeedsUpdateConstraints()
  }
  
  override func updateViewConstraints() {
    
    if (!didSetupConstraints) {
        
      splashImage.snp.makeConstraints { (make) in
        make.size.equalTo(280)
        make.centerX.equalToSuperview()
        make.centerY.equalToSuperview().offset(-20)
      }
    
      didSetupConstraints = true
    }
    
    super.updateViewConstraints()
  }
  
  
  // MARK: - SplashViewInput
  
  func showLoading() {}
  
  func hideLoading() {}
}

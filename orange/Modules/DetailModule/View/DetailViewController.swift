//
//  DetailViewController.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import UIKit

protocol DetailViewInput:  AlertPresentable, Loadable {
  func setImage(imageURL: String)
}

class DetailViewController: UIViewController, DetailViewInput {
  
  // MARK: - Properties
  var presenter: DetailViewOutput?
  private var didSetupConstraints = false
  
  private let activityIndicatorView: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    indicator.color = .systemOrange
    indicator.style = .large
    indicator.isHidden = true
    return indicator
  }()
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
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
    view.addSubview(imageView)
    view.setNeedsUpdateConstraints()
  }
  
  override func updateViewConstraints() {
    
    if (!didSetupConstraints) {
        
      imageView.snp.makeConstraints { (make) in
        make.center.equalToSuperview()
        make.edges.equalToSuperview()
      }
      
      didSetupConstraints = true
    }
    
    super.updateViewConstraints()
  }
  
  // MARK: - DetailViewInput
  
  func showLoading() {
    activityIndicatorView.isHidden = false
    activityIndicatorView.startAnimating()
  }
  
  func hideLoading() {
    activityIndicatorView.stopAnimating()
    activityIndicatorView.isHidden = true
  }
  
  func setImage(imageURL: String) {
    imageView.sd_setImage(with: URL(string: imageURL))
  }
}

//
//  PhotoCell.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {
  
  // MARK: - Properties
  
  private var didSetupConstraints = false
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .blue
    imageView.cornerRadius = 30
    return imageView
  }()
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubViews()
    addActionsToViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
}

// MARK: - SET UI

extension PhotoCell {
  
  private func addSubViews() {
    addSubview(imageView)
    contentView.setNeedsUpdateConstraints()
  }
  
  private func addActionsToViews() {}
  
  fileprivate func layout() {
    if (!didSetupConstraints) {
      imageView.snp.makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
      didSetupConstraints = true
    }
  }
}


// MARK: - Configurable

extension PhotoCell: Configurable {
    
    struct Model {
      let imageURL: Urls
    }
    
    func configure(with model: Model) {
      let imageURL = model.imageURL.regular
      imageView.sd_setImage(with: URL(string: imageURL))
    }
}

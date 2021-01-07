//
//  MainViewController.swift
//  orange_wallpaper
//
//  Created by Rizabek on 12.12.2020.
//

import UIKit

protocol MainViewInput:  AlertPresentable, Loadable {
  func update(with viewModel: MainViewViewModel)
}

class MainViewController: UIViewController, MainViewInput {
  
  // MARK: - Properties
  private var viewModel: MainViewViewModel?
  var presenter: MainViewOutput?
  private var didSetupConstraints = false
  
  private let activityIndicatorView: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    indicator.color = .systemOrange
    indicator.style = .large
    indicator.isHidden = true
    return indicator
  }()
  
  private let navigationView: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    return view
  }()
  
  private let navigationImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "navigationIcon")
    return imageView
  }()
  
  private let instagramBtn: UIButton = {
    let btn = UIButton()
    btn.setImage(#imageLiteral(resourceName: "instagramBtn").withRenderingMode(.alwaysOriginal), for: .normal)
    return btn
  }()
  
  private lazy var collectionView: UICollectionView = {
    let layout = CustomCollectionViewLayout()
    layout.delegate = self
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .systemOrange
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
    return collectionView
  }()
  
  // MARK: - LIVE CIRCLE
  
  override func viewDidLoad() {
    super.viewDidLoad()
 
    addSubViews()
    presenter?.viewIsReady()
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  // MARK: - SET UI
  private func addSubViews() {
    _ = [navigationImage, instagramBtn].map { navigationView.addSubview($0) }
    _ = [navigationView, collectionView, activityIndicatorView].map { view.addSubview($0) }
    view.setNeedsUpdateConstraints()
  }
  
  override func updateViewConstraints() {
    
    if (!didSetupConstraints) {
        
      navigationView.snp.makeConstraints { (make) in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide)
        make.height.equalTo(54)
      }
      
      instagramBtn.snp.makeConstraints { (make) in
        make.size.equalTo(18)
        make.centerY.equalToSuperview()
        make.leading.equalToSuperview().offset(16)
      }
      
      navigationImage.snp.makeConstraints { (make) in
        make.center.equalToSuperview()
      }
      
      collectionView.snp.makeConstraints { (make) in
        make.top.equalTo(navigationView.snp.bottom)
        make.leading.trailing.bottom.equalToSuperview()
      }
      
      activityIndicatorView.snp.makeConstraints { (make) in
        make.center.equalToSuperview()
      }
      
      didSetupConstraints = true
    }
    
    super.updateViewConstraints()
  }
  
  
  // MARK: - MainViewInput
  
  func showLoading() {
    activityIndicatorView.isHidden = false
    collectionView.isHidden = true
    activityIndicatorView.startAnimating()
  }
  
  func hideLoading() {
    activityIndicatorView.stopAnimating()
    activityIndicatorView.isHidden = true
    collectionView.isHidden = false
  }
  
  func update(with viewModel: MainViewViewModel) {
    DispatchQueue.main.async {
      self.viewModel = viewModel
      self.collectionView.reloadData()
    }
  }
}


// MARK: - UICollectionView Protocols
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, CustomCollectionViewLayoutDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel?.rows.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let row = viewModel?.rows[indexPath.row] else {
      assertionFailure("Failed to init cell \(className)")
        return UICollectionViewCell()
    }

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: row.reuseId, for: indexPath)
    row.configurator.configure(cell: cell)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter?.didSelectCell(at: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    
    let height = (viewModel?.rows[indexPath.row].configurator.size.height)!
    return height
  }
}

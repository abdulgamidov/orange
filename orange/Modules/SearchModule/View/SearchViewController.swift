//
//  SearchViewController.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import UIKit

protocol SearchViewInput:  AlertPresentable, Loadable {
  func update(with viewModel: SearchViewViewModel)
}

class SearchViewController: UIViewController, SearchViewInput {
  
  // MARK: - Properties
  private var viewModel: SearchViewViewModel?
  var presenter: SearchViewOutput?
  private var didSetupConstraints = false
  
  private let splashImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "splashImage")
    return imageView
  }()
  
  private let activityIndicatorView: UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView()
    indicator.color = .systemOrange
    indicator.style = .large
    indicator.isHidden = true
    return indicator
  }()
  
  private lazy var collectionView: UICollectionView = {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .systemOrange
    collectionView.isHidden = true
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
    return collectionView
  }()
  
  // MARK: - LIVE CIRCLE
  
  override func viewDidLoad() {
    super.viewDidLoad()
 
    addSubViews()
    setupNavigation()
    presenter?.viewIsReady()
  }
  
  // MARK: - SET UI
  private func addSubViews() {
    [collectionView, splashImage, activityIndicatorView].forEach { view.addSubview($0) }
    view.setNeedsUpdateConstraints()
  }
  
  private func setupNavigation() {
    let searchController = UISearchController()
    searchController.searchBar.delegate = self
    searchController.obscuresBackgroundDuringPresentation = true
    searchController.searchBar.placeholder = ""
    searchController.searchBar.barTintColor = .systemOrange
    searchController.searchBar.tintColor = .systemOrange
    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
    navigationItem.title = "Search"
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.isTranslucent = false
    let navBarAppearance = UINavigationBarAppearance()
      navBarAppearance.configureWithOpaqueBackground()
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
      navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemOrange]
      navBarAppearance.backgroundColor = .black
    navigationController?.navigationBar.standardAppearance = navBarAppearance
    navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
  }
  
  override func updateViewConstraints() {
    
    if (!didSetupConstraints) {
      
      collectionView.snp.makeConstraints { (make) in
        make.edges.equalTo(view.safeAreaLayoutGuide)
      }
      
      activityIndicatorView.snp.makeConstraints { (make) in
        make.centerX.equalToSuperview()
        make.centerY.equalToSuperview().offset(-50)
      }
      
      splashImage.snp.makeConstraints { (make) in
        make.size.equalTo(280)
        make.center.equalToSuperview()
      }
      
      didSetupConstraints = true
    }
    
    super.updateViewConstraints()
  }
  
  
  // MARK: - SearchViewInput
  
  func showLoading() {
    activityIndicatorView.isHidden = false
    self.splashImage.isHidden = true
    self.collectionView.isHidden = true
    activityIndicatorView.startAnimating()
  }
  
  func hideLoading() {
    activityIndicatorView.stopAnimating()
    activityIndicatorView.isHidden = true
    self.splashImage.isHidden = true
    self.collectionView.isHidden = false
  }
  
  func update(with viewModel: SearchViewViewModel) {
    DispatchQueue.main.async {
      self.viewModel = viewModel
      self.collectionView.reloadData()
    }
  }
  
  // MARK: - Actions
  
  @objc func reload(_ searchBar: UISearchBar) {
      guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
          collectionView.isHidden = true
          splashImage.isHidden = false
          return
      }
      presenter?.searchImage(queryString: query, page: 1)
  }
}


// MARK: - UICollectionView Protocols

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = collectionView.frame.width
    let height = (width * 0.85).rounded(.up)
    return CGSize(width: width, height: height)
  }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
    perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 1)
  }
}

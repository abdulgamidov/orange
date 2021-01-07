//
//  MainViewDataProvider.swift
//  orange_wallpaper
//
//  Created by Rizabek on 13.12.2020.
//

import UIKit

protocol MainViewDataProviderInput {
    func createViewModel(with photo: [Photo]) -> MainViewViewModel
}


final class MainViewDataProvider: MainViewDataProviderInput {
 
  func createViewModel(with photo: [Photo]) -> MainViewViewModel {
    typealias PhotosConfigurator = CollectionCellConfigurator<PhotoCell, PhotoCell.Model>
  
    let rows: [MainViewViewModel.Row] = photo.map {
      let model = PhotoCell.Model(imageURL: $0.urls)
      let width = $0.width / 10
      let height = $0.height / 10
      let size = CGSize(width: width, height: height)
      let configurator = PhotosConfigurator(item: model, size: size)
      return .photoItem(configurator: configurator)
    }

    return MainViewViewModel(rows: rows)
  }
}

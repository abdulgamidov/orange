//
//  SearchViewDataProvider.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import UIKit

protocol SearchViewDataProviderInput {
  func createViewModel(with photo: [SearchPhotos]) -> SearchViewViewModel
}

final class SearchViewDataProvider: SearchViewDataProviderInput {
  func createViewModel(with photo: [SearchPhotos]) -> SearchViewViewModel {
    typealias PhotosConfigurator = CollectionCellConfigurator<PhotoCell, PhotoCell.Model>
    
    var rows: [SearchViewViewModel.Row] = []
    photo.forEach { (photos) in
      photos.results.forEach { (result) in
        let model = PhotoCell.Model(imageURL: result.urls)
        let configurator = PhotosConfigurator(item: model, size: .zero)
        rows.append(.photoItem(configurator: configurator))
      }
    }
    return SearchViewViewModel(rows: rows)
  }
}

//
//  SearchViewInteractor.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

protocol SearchViewInteractorInput {
  func getPhotoList(queryString: String, page: Int)
}

final class SearchViewInteractor {
    
    // MARK: - Properties
    
    weak var presenter: SearchViewInteractorOutput?
    private let mainService: SearchService
  
    // MARK: - Init
    
    init(mainService: SearchService) {
      self.mainService = mainService
    }
}


// MARK: - SearchViewInteractorInput
extension SearchViewInteractor: SearchViewInteractorInput {
    func getPhotoList(queryString: String, page: Int) {
      mainService.searchImage(queryString: queryString, page: page) { (result) in
        switch result {
        
        case .success(let photo):
          self.presenter?.didSuccesSearch(with: [photo])
        case .failure(let error):
          self.presenter?.didFailSearch(with: error)
        }
      }
    }
}

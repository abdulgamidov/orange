//
//  SearchService.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import Foundation

protocol SearchService {
  func searchImage(queryString: String, page: Int, completion: @escaping (Result<SearchPhotos>) -> Void)
}

final class SearchServiceImp: SearchService {

    // MARK: - Properties
    
    private let networkService: NetworkService<SearchEndpoint>
    
    // MARK: - Init
    
    init(networkService: NetworkService<SearchEndpoint>) {
        self.networkService = networkService
    }
    
    // MARK: - MainService
    
  func searchImage(queryString: String, page: Int, completion: @escaping (Result<SearchPhotos>) -> Void) {
    let endpoint = SearchEndpoint.searchImage(queryString: queryString, page: page)
    networkService.request(endpoint: endpoint) { (result: Result<SearchPhotos>) in
      switch result {
      case .success(let response):
        completion(.success(response))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}

//
//  MainService.swift
//  orange_wallpaper
//
//  Created by Rizabek on 13.12.2020.
//

import Foundation

protocol MainService {
  func getPhotoList(page: Int, order: String, completion: @escaping (Result<[Photo]>) -> Void)
}

final class MainServiceImp: MainService {

    // MARK: - Properties
    
    private let networkService: NetworkService<MainEndpoint>
    
    // MARK: - Init
    
    init(networkService: NetworkService<MainEndpoint>) {
        self.networkService = networkService
    }
    
    // MARK: - MainService
    
  func getPhotoList(page: Int, order: String, completion: @escaping (Result<[Photo]>) -> Void) {
    let endpoint = MainEndpoint.getPhotoList(page: page, order: order)
    networkService.request(endpoint: endpoint) { (result: Result<[Photo]>) in
      switch result {
      case .success(let response):
        completion(.success(response))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}

//
//  MainViewInteractor.swift
//  orange_wallpaper
//
//  Created by Rizabek on 12.12.2020.
//

protocol MainViewInteractorInput {
  func getPhotoList(page: Int, order: String)
}

final class MainViewInteractor {
    
    // MARK: - Properties
    
    weak var presenter: MainViewInteractorOutput?
    private let mainService: MainService
  
    // MARK: - Init
    
    init(mainService: MainService) {
      self.mainService = mainService
    }
}


// MARK: - MainViewInteractorInput
extension MainViewInteractor: MainViewInteractorInput {
    func getPhotoList(page: Int, order: String) {
      mainService.getPhotoList(page: page, order: order) { (result) in
        switch result {
        
        case .success(let photo):
          self.presenter?.didSuccesLoadPhoto(with: photo)
        case .failure(let error):
          self.presenter?.didFailLoadPhoto(with: error)
        }
      }
    }
}

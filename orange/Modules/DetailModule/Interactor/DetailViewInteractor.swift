//
//  DetailViewInteractor.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

protocol DetailViewInteractorInput {}

final class DetailViewInteractor {
    
    // MARK: - Properties
    
    weak var presenter: DetailViewInteractorOutput?
  
    // MARK: - Init
    
    init() { }
}


// MARK: - DetailViewInteractorInput
extension DetailViewInteractor: DetailViewInteractorInput {
}

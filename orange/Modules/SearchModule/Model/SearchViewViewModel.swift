//
//  SearchViewViewModel.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import UIKit

struct SearchViewViewModel {
    
    var rows: [Row]
    
    enum Row {
        case photoItem(configurator: CollectionCellConfiguratorProtocol)
      
        var configurator: CollectionCellConfiguratorProtocol {
            
            switch self {
                
            case let .photoItem(configurator):
                return configurator
            }
        }
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}

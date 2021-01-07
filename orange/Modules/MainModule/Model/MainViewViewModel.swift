//
//  MainViewViewModel.swift
//  orange_wallpaper
//
//  Created by Rizabek on 13.12.2020.
//

import UIKit

struct MainViewViewModel {
    
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

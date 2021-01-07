//
//  MainEndpoint.swift
//  orange_wallpaper
//
//  Created by Rizabek on 13.12.2020.
//

import Foundation
import Alamofire

enum MainEndpoint: EndpointProtocol {
  case getPhotoList(page: Int, order: String)
  var path: String {
    
    switch self {
    case .getPhotoList:
      return "/photos"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .getPhotoList:
      return .get
    }
  }
  
  var headers: HTTPHeaders? {
    switch self {
    case .getPhotoList:
      return nil
    }
  }
  
  var parameters: Parameters? {
    switch self {
    case let .getPhotoList(page, order):
      return [
        "client_id": ServiceConstants.accesKey,
        "page": page,
        "per_page": 30,
        "order": order
      ]
    }
  }
}

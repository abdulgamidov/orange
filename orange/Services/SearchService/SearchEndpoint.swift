//
//  SearchEndpoint.swift
//  orange
//
//  Created by Rizabek on 14.12.2020.
//

import Foundation
import Alamofire

enum SearchEndpoint: EndpointProtocol {
  case searchImage(queryString: String, page: Int)
  var path: String {
    
    switch self {
    case .searchImage:
      return "/search/photos"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .searchImage:
      return .get
    }
  }
  
  var headers: HTTPHeaders? {
    switch self {
    case .searchImage:
      return nil
    }
  }
  
  var parameters: Parameters? {
    switch self {
    case let .searchImage(queryString, page):
      return [
        "client_id": ServiceConstants.accesKey,
        "query": queryString,
        "orientation": "portrait",
        "page": page,
        "per_page": 30,
        "order_by": "relevant"
      ]
    }
  }
}

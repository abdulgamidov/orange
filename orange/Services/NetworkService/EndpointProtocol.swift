//
//  EndpointProtocol.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import Foundation
import Alamofire

protocol EndpointProtocol {
    var baseUrl: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { get }
}

extension EndpointProtocol {
  
    var baseUrl: URL? {
        return ServiceConstants.baseUrl
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding()
        default:
            return URLEncoding.httpBody
        }
    }
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }
    
}

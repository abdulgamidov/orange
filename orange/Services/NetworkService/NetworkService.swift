//
//  NetworkService.swift
//  orange_wallpaper
//
//  Created by Rizabek on 11.12.2020.
//

import Foundation
import Alamofire

// MARK: - Network Service Implementation
final class NetworkService<Endpoint: EndpointProtocol> {
    
    // MARK: - Init
    
    init() {
        
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.millisecondsSince1970
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = ServiceConstants.requestTimeout
        sessionConfiguration.timeoutIntervalForResource = ServiceConstants.resourceTimeout
        
        sessionConfiguration.headers = .default
        
        self.alamofireManager = Alamofire.Session(configuration: sessionConfiguration)
        
    }
    
    
    // MARK: - Properties
    
    private let decoder: JSONDecoder
    private let alamofireManager: Session

    // MARK: - Request
    func request<Response>(
        endpoint: Endpoint,
        completion: @escaping (Result<Response>) -> Void) where Response: Decodable {
        
        guard let baseUrl = endpoint.baseUrl else {
            completion(Result.failure(.noBaseUrl))
            return
        }
        
        decoder.keyDecodingStrategy = endpoint.keyDecodingStrategy
        
        let url = baseUrl.appendingPathComponent(endpoint.path)
        
        alamofireManager.request(url, method: endpoint.method,
                                 parameters: endpoint.parameters,
                                 encoding: endpoint.encoding,
                                 headers: .default).response { [weak self] response in
                                    
                                    guard let self = self else { return }
                                    
                                    let result: Result<Response>
                                    
                                    defer {
                                        DispatchQueue.main.async {
                                            completion(result)
                                        }
                                    }
                                    
                                    guard let httpResponse = response.response else {
                                        result = Result.failure(APIError.noNetwork)
                                        return
                                    }
                                    
                                    guard (ServiceConstants.validCodes ~= httpResponse.statusCode) else {
                                        
                                      let serverError = self.createServerError(from: response)
                                        result = Result.failure(serverError)
                                        return
                                    }
                                    
                                    guard let data = response.data else {
                                        let serverError = self.createServerError(from: response)
                                        result = Result.failure(serverError)
                                        return
                                    }
                                    
                                    do {
                                        let object = try self.decoder.decode(Response.self, from: data)
                                        result = Result.success(object)
                                    } catch (let error) {
                                        NSLog(error.localizedDescription)
                                        result = Result.failure(.decodingError)
                                    }
        }
        
    }
    
    
    // MARK: - Server Error methods
    
  private func createServerError(from response: AFDataResponse<Data?>) -> APIError {
        
        guard let data = response.data else {
            return APIError.serverError(error: response.error, response: response.response, data: response.data)
        }
        
        do {
            let error = try decoder.decode(ParsableError.self, from: data)
            return APIError.parsableError(error)
            
        } catch {
            return APIError.serverError(error: response.error, response: response.response, data: response.data)
        }
    }
}

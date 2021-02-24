//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Foundation
import Combine

public enum ClientError: Error {
    case couldNotDecodeJSON
    case badStatus(Int, String)
    case noReachability
    case badRefreshToken
    case unauthorizedError
    case requestEntityTooLarge
    case clientError
    case serverError
    
    public var code : Int? {
        switch self {
        case .unauthorizedError:
            return 401
        case .requestEntityTooLarge:
            return 413
        case .clientError:
            return 417
        case .serverError:
            return 500
        case .badStatus(let code, _):
            return code
        default:
            return nil
        }
    }
    
}

protocol ClientProtocol {
    func connectedToNetwork() -> Future<Bool, Error>
    func getEmpty(forResource resource: Resource) -> AnyPublisher<(), Error>
    func getObject<T: Decodable>(forResource resource: Resource) -> AnyPublisher<T, Error>
    func getObjects<T: Decodable>(forResource resource: Resource) -> AnyPublisher<[T], Error>
}

public struct Client {
    
    var fetcher: HTTPFetcher
    
    public init(fetcher: HTTPFetcher = URLSession(configuration: URLSessionConfiguration.default)) {
        self.fetcher = fetcher
    }
    
    public func getObject<T: Decodable>(forResource resource: Resource) -> AnyPublisher<T, Error> {
        getObject(forRequest: resource.request(additionalParameters: [:]))
    }
    
    public func getObjects<T: Decodable>(forResource resource: Resource) -> AnyPublisher<[T], Error> {
        getObjects(forRequest: resource.request(additionalParameters: [:]))
    }
    
    public func getEmpty(forResource resource: Resource) -> AnyPublisher<(), Error> {
        let request = resource.request(additionalParameters: [:])
        return self.fetcher.data(request: request).map({ _ in
            return ()
        }).eraseToAnyPublisher()
    }
    
    public func getObject<T: Decodable>(forRequest request: URLRequest) -> AnyPublisher<T, Error> {
        let decoder = CustomDecoder()
        return fetcher.data(request: request).decode(type: T.self, decoder: decoder).eraseToAnyPublisher()
    }
    
    public func getObjects<T: Decodable>(forRequest request: URLRequest) -> AnyPublisher<[T], Error> {
        let decoder = CustomDecoder()
        return  fetcher.data(request: request).decode(type: [T].self, decoder: decoder).eraseToAnyPublisher()
    }
    
}

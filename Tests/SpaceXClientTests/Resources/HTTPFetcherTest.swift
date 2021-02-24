//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Foundation
import Combine

@testable import SpaceXClient

class HTTPFetcherTest: HTTPFetcher {
    
    var data : Data?
    var error : Error?
    
    func data(request: URLRequest) -> AnyPublisher<Data, Error> {
        Future<Data,Error> { promise in
            if let error = self.error {
                promise(.failure(error))
            }
            if let data = self.data {
                promise(.success(data))
            }
        }.eraseToAnyPublisher()
    }
    
}

//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Foundation
import Combine
/// An object that fetches the data for a HTTP request
public protocol HTTPFetcher {

    /// Fetches the contents of a URL based on the specified request object.
    ///
    /// - parameter request: An `NSURLRequest` object that provides the URL, request type, etc.
    ///
    /// - returns: An observable that will send the contents and complete.
    func data(request: URLRequest) -> AnyPublisher<Data, Error>
}

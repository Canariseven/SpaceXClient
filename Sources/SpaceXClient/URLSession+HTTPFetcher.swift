//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Combine
import Foundation

extension URLSession: HTTPFetcher {

    fileprivate static func generateError(_ element: URLSession.DataTaskPublisher.Output) -> NSError {
        var userInfo = [String: Any]()
        if let json = try? JSONSerialization.jsonObject(with: element.data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] {
            userInfo = json
        }
        return NSError(domain: "SpaceXApp", code: (element.response as! HTTPURLResponse).statusCode, userInfo: userInfo)
    }

    public func data(request: URLRequest) -> AnyPublisher<Data, Error> {
        self.dataTaskPublisher(for: request)
            .tryMap { (element) -> Data  in
                if (200...399).contains((element.response as! HTTPURLResponse).statusCode) {
                    return element.data
                } else {
                    throw URLSession.generateError(element)
                }
            }.eraseToAnyPublisher()
    }

}

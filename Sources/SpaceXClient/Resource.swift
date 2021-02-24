//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Foundation


import Foundation

public enum Method: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    case JSON = "JSON"
}

public enum TypeBody {
    case JSON
    case SERIAL
    case URL
    case MultiPart
}

public protocol Resource {
    var method: Method { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var token: String? { get }
    var baseURL: String { get }
    var typeBody: TypeBody? { get }
}

extension Resource {

    public var method: Method {
        return .GET
    }

    public var parameters: [String: AnyObject] {
        return [:]
    }

    public var token: String {
        return ""
    }

    public func request(additionalParameters: [String: Any] = [:]) -> URLRequest {
        let url = URL(string: baseURL)!.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        var request = NSMutableURLRequest(url: components.url!)
        var parameters = [String: Any]()
        parameters = self.parameters
        additionalParameters.forEach {
            parameters.updateValue($1, forKey: $0)
        }
        
        if typeBody == TypeBody.URL {
            components.queryItems = []
            parameters.forEach({
                components.queryItems!.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
            })
            request = NSMutableURLRequest(url: components.url!)
        } else if typeBody == TypeBody.JSON {
            request.httpBody = JSONCreator.createJsonWithParameters(parameters: parameters)
        } else if typeBody != nil {
            request.httpBody = JSONCreator.createDataForBodyRequestWithParameters(parameters: parameters)
        }

        if let token = token, !token.isEmpty {
            request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        }
        if typeBody == TypeBody.JSON {
            request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
        } else if typeBody == TypeBody.MultiPart {
            request.addValue("Keep-Alive", forHTTPHeaderField: "Connection")
            request.addValue("no-cache", forHTTPHeaderField: "Cache-Control")
        }
        request.httpMethod = method.rawValue
        return request as URLRequest
    }

}

class JSONCreator {

    class func createJsonWithParameters(parameters: [String: Any]) -> Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            return jsonData
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }

    class func createDataForBodyRequestWithParameters(parameters: [String: Any]) -> Data? {
        var stringBody: String = ""
        let charReserverd = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] ").inverted
        parameters.forEach {
            guard let str = $1 as? String else {
                return
            }
            let paramSTR: String = str.addingPercentEncoding(withAllowedCharacters: charReserverd)!
            stringBody = (stringBody.isEmpty ? "" : (stringBody + "&")) + $0 + "=" + (paramSTR)
        }

        return stringBody.data(using: String.Encoding.utf8)
    }

}

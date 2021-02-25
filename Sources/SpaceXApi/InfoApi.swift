//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Foundation
import SpaceXClient

public enum InfoApi: Resource {

    case getCompanyInfo

    public var path: String {
        switch self {
        case .getCompanyInfo:
            return "v3/info"
        }
    }

    public var baseURL: String {
        switch self {
        case .getCompanyInfo:
            return "https://api.spacexdata.com/"
        }
    }

    public var typeBody: TypeBody? {
        switch self {
        case .getCompanyInfo:
            return nil
        }
    }

    public var token: String? {
        return nil
    }

    public var parameters: [String : Any] {
        switch self {
        case .getCompanyInfo:
            return [:]
        }
    }

    public var method: SpaceXClient.Method {
        switch self {
        case .getCompanyInfo:
            return .GET
        }
    }
    
}

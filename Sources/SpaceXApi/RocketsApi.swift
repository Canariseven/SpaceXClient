//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Foundation
import SpaceXClient

public enum RocketsApi: Resource {

    case getAllRockets

    public var path: String {
        switch self {
        case .getAllRockets:
            return "v4/rockets"
        }
    }

    public var baseURL: String {
        switch self {
        case .getAllRockets:
            return "https://api.spacexdata.com/"
        }
    }

    public var typeBody: TypeBody? {
        switch self {
        case .getAllRockets:
            return nil
        }
    }

    public var token: String? {
        return nil
    }

    public var parameters: [String : Any] {
        switch self {
        case .getAllRockets:
            return [:]
        }
    }

    public var method: SpaceXClient.Method {
        switch self {
        case .getAllRockets:
            return .GET
        }
    }
    
}

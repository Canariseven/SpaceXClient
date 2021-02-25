//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Foundation
import SpaceXClient

public enum MissionsApi: Resource {

    case getAllMissions

    public var path: String {
        switch self {
        case .getAllMissions:
            return "v3/missions"
        }
    }

    public var baseURL: String {
        switch self {
        case .getAllMissions:
            return "https://api.spacexdata.com/"
        }
    }

    public var typeBody: TypeBody? {
        switch self {
        case .getAllMissions:
            return nil
        }
    }

    public var token: String? {
        return nil
    }

    public var parameters: [String : Any] {
        switch self {
        case .getAllMissions:
            return [:]
        }
    }

    public var method: SpaceXClient.Method {
        switch self {
        case .getAllMissions:
            return .GET
        }
    }
    
}

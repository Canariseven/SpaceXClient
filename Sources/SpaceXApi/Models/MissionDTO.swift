//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Foundation

public struct MissionDTO: Decodable {
    
    public let mission_name : String
    public let mission_id : String
    public let manufacturers : [String]
    public let payload_ids: [String]
    public let wikipedia: URL
    public let website: URL    
    public let description: String

}


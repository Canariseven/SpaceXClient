//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Foundation


public struct HeadquartersDTO: Decodable {
    
    public let address: String
    public let city: String
    public let state: String
    
}

public struct CompanyInfoDTO: Decodable {
    
    public let name : String
    public let founder : String
    public let founded : Int
    public let employees : Int
    public let vehicles: Int
    public let launch_sites: Int
    public let test_sites: Int
    public let ceo : String
    public let cto: String
    public let coo: String
    public let cto_propulsion: String
    public let valuation: Double
    public let headquarters: HeadquartersDTO
    public let summary: String

}

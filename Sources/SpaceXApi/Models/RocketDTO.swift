//
//  RocketDTO.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Foundation

public struct HeightDTO: Decodable {
    public let meters: Float
}

public struct DiameterDTO: Decodable{
    public let meters: Float
}

public struct MassDTO: Decodable {
    public let kg: Float
}

public struct RocketDTO : Decodable {
    public let flickr_images : [URL]
    public let height: HeightDTO
    public let diameter: DiameterDTO
    public let mass: MassDTO
    public let name: String
    public let type: String
    public let active: Bool
    public let stages: Int8
    public let country: String
    public let company: String
    public let wikipedia : URL
    public let description: String
    public let id : String
}

//
//  RocketDTO.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Foundation

struct HeightDTO: Decodable {
    let meters: Float
}

struct DiameterDTO: Decodable{
    let meters: Float
}

struct MassDTO: Decodable {
    let kg: Float
}

struct RocketsDTO : Decodable {
    let flickr_images : [URL]
    let height: HeightDTO
    let diameter: DiameterDTO
    let mass: MassDTO
    let name: String
    let type: String
    let active: Bool
    let stages: Int8
    let country: String
    let company: String
    let wikipedia : URL
    let description: String
    let id : String
}

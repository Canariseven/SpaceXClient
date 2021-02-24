//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Combine
import Foundation
import SpaceXClient

public extension Client {

    func getAllRockets() -> AnyPublisher<[RocketDTO], Error> {
        self.getObjects(forResource: RocketsApi.getAllRockets)
    }

}

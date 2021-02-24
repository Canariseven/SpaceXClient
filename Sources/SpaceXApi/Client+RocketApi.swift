//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Combine
import Foundation
import SpaceXClient

extension Client {

    func getAllRockets() -> AnyPublisher<[RocketsDTO], Error> {
        self.getObjects(forResource: RocketsApi.getAllRockets)
    }

}

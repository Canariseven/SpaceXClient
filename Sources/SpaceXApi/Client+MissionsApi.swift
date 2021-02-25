//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Combine
import Foundation
import SpaceXClient

public extension Client {

    func getAllMissions() -> AnyPublisher<[MissionDTO], Error> {
        self.getObjects(forResource: MissionsApi.getAllMissions)
    }

}

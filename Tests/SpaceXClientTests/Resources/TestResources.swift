//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Foundation


enum ApiMocks {
    
    static func getAllRocketsData() throws ->  Data? {
        if let urlAllRockets = Bundle.module.url(forResource: "AllRockets", withExtension: "json") {
            return try Data(contentsOf: urlAllRockets)
        }
        return nil
    }
    
}

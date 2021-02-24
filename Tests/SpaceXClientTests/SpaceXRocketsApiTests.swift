//
//  SpaceXRocketsApiTests.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import XCTest
import Combine
@testable import SpaceXClient
@testable import SpaceXApi

final class SpaceXRocketsApiTests: XCTestCase {
    
    var subscribers: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func testGetAllRockets() throws {
        let exp = expectation(description: "Expectation :>> Get All Rockets")
        let fetchertTest : HTTPFetcherTest = HTTPFetcherTest()
        let client : Client = Client(fetcher: fetchertTest)
        fetchertTest.data = try ApiMocks.getAllRocketsData()
        
        client.getAllRockets().sink { (result) in
            switch result {
            case .finished:
                exp.fulfill()
            case .failure(let error):
                debugPrint("GetAllRockets Error: \(error)")
            }
        } receiveValue: { (list) in
            XCTAssert(list.count == 4)
        }.store(in: &subscribers)

        wait(for: [exp], timeout: 1.0)
    }

    static var allTests = [
        ("testGetAllRockets", testGetAllRockets),
    ]
}

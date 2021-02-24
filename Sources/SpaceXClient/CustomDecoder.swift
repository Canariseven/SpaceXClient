//
//  File.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import Foundation

import Foundation

open class CustomDecoder: JSONDecoder {

    public override init() {
        super.init()
        setup()
    }

    func setup() {
        dateDecodingStrategy = .millisecondsSince1970
    }

}

//
//  Check.swift
//  Checkit-iOS
//
//  Created by Peter Hitchcock on 3/11/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import Foundation

class Check {
    var name: String
    var number: String
    var amount: String
    var date: String

    init(name: String, number: String, amount: String, date: String) {
        self.name = name
        self.number = number
        self.amount = amount
        self.date = date
    }
}
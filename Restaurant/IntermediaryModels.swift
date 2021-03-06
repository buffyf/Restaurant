//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Barbara Feinstein on 4/13/19.
//  Copyright © 2019 Barbara Feinstein. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}

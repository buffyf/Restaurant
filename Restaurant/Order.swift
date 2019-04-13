//
//  Order.swift
//  Restaurant
//
//  Created by Barbara Feinstein on 4/13/19.
//  Copyright © 2019 Barbara Feinstein. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}

//
//  MenuController.swift
//  Restaurant
//
//  Created by Barbara Feinstein on 4/13/19.
//  Copyright © 2019 Barbara Feinstein. All rights reserved.
//

import Foundation

class MenuController {
    let baseURL = URL(string: "http://localhost:8090/")!


func fetchCategories(completion: @escaping ([String]?) -> Void) {
    let categoryURL = baseURL.appendingPathComponent("categories")
    let task = URLSession.shared.dataTask(with: categoryURL)
    {(data, response, error) in
        
    }
    task.resume()
}

func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
    let initialMenuURL = baseURL.appendingPathComponent("menu")
    var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
    components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
    let menuURL = components.url!
    let task = URLSession.shared.dataTask(with: menuURL)
    { (data, response, error) in
        
    }
    task.resume()
}


func submitOrder(forMenuIDs menuIds: [Int], completion: (Int?) -> Void) {
    let orderURL = baseURL.appendingPathComponent("order")
    var request = URLRequest(url: orderURL)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let data: [String: [Int]] = ["menuIds": menuIds]
    let jsonEncoder = JSONEncoder()
    let jsonData = try? jsonEncoder.encode(data)
    request.httpBody = jsonData
    let task = URLSession.shared.dataTask(with: request)
    { (data, response, error) in
        
    }
    task.resume()
}
}
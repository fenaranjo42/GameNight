//
//  BasketballData.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

typealias JSONObject = [String: Any]

protocol JSONProvider: class {
  func basketballJSON() -> JSONObject
}

class BasketballData: JSONProvider {
  
  private var jsonPath: String {
    return Bundle(for: type(of: self)).path(forResource: "basketballData", ofType: "json")!
  }
  
  func basketballJSON() -> JSONObject {
    do {
      let data = try NSData(contentsOfFile: jsonPath, options: .mappedIfSafe) as Data
      guard let mockDataJSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? JSONObject else { fatalError("Error reading from JSON file!") }
      return mockDataJSON
    } catch {
      fatalError("Error reading from JSON file!")
    }
  }
  
}

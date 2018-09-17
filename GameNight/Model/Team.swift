//
//  Team.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

struct Team: Codable  {
  let id: Int
  let name: String
  let city: String
  let record: String
  let fullName: String
  let abbreviation: String
  let colorHex: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case city
    case record
    case fullName = "full_name"
    case abbreviation = "abbrev"
    case colorHex = "color"
  }
}

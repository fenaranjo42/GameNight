//
//  Player.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/16/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

struct Player: Codable {
  let id: Int
  let name: String
  let teamId: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case teamId = "team_id"
  }
  
}

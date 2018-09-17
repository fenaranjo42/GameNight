//
//  Player.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

struct PlayerData: Codable {
  let id: Int
  let name: String
  let teamId: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case teamId = "team_id"
  }
  
}

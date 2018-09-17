//
//  PlayerStats.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

struct PlayerStats: Codable {
  let id: Int
  let gameId: Int
  let playerId: Int
  let teamId: Int
  let points: Int
  let assists: Int
  let rebounds: Int
  let nerd: Double
  
  enum CodingKeys: String, CodingKey {
    case id
    case gameId = "game_id"
    case playerId = "player_id"
    case teamId = "team_id"
    case points
    case assists
    case rebounds
    case nerd
  }
}

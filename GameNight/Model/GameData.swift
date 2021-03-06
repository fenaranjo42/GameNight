//
//  Game.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

struct GameData: Codable  {
  let id: Int
  let homeTeamId: Int
  let awayTeamId: Int
  let date: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case homeTeamId = "home_team_id"
    case awayTeamId = "away_team_id"
    case date
  }
}


//
//  PlayersService.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/16/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

protocol PlayersDataParsing: class {
  func players(completion: @escaping ([Player]) -> Void)
  func stats(completion: @escaping ([PlayerStats]) -> Void)
}

class PlayersService: PlayersDataParsing {
  
  let data = BasketballData().basketballJSON()
  
  func players(completion: @escaping ([Player]) -> Void) {
    do {
        if let players = data["players"] as? [[String: Any]] {
          let json = try JSONSerialization.data(withJSONObject: players)
          let decodedPlayers = try JSONDecoder().decode([Player].self, from: json)
          completion(decodedPlayers)
        }
    } catch let error {
      print(error)
    }
  }
  
  func stats(completion: @escaping ([PlayerStats]) -> Void) {
    do {
      if let stats = data["player_stats"] as? [[String: Any]] {
        let json = try JSONSerialization.data(withJSONObject: stats)
        let decodedStats = try JSONDecoder().decode([PlayerStats].self, from: json)
        completion(decodedStats)
      }
    } catch let error {
      print(error)
    }
    completion(nil)
  }
  
  
}

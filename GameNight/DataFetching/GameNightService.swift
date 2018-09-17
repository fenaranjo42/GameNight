//
//  GameNightService.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

protocol GameParsing: class {
  func games(completion: @escaping ([GameData]) -> Void)
  func states(completion: @escaping ([GameState]) -> Void)
  func teams(completion: @escaping ([Team]) -> Void)
}

class GameNightService: GameParsing {
  
  let data = BasketballData().basketballJSON()
  
  func games(completion: @escaping ([GameData]) -> Void) {
    do {
        if let players = data["games"] as? [[String: Any]] {
          let json = try JSONSerialization.data(withJSONObject: players)
          let decodedGames = try JSONDecoder().decode([GameData].self, from: json)
          completion(decodedGames)
        }
    } catch let error {
      print(error)
    }
  }
  
  func states(completion: @escaping ([GameState]) -> Void) {
    do {
      if let players = data["game_states"] as? [[String: Any]] {
        let json = try JSONSerialization.data(withJSONObject: players)
        let decodedState = try JSONDecoder().decode([GameState].self, from: json)
        completion(decodedState)
      }
    } catch let error {
      print(error)
    }
  }
  
  func teams(completion: @escaping ([Team]) -> Void) {
    do {
      if let players = data["teams"] as? [[String: Any]] {
        let json = try JSONSerialization.data(withJSONObject: players)
        let decodedTeams = try JSONDecoder().decode([Team].self, from: json)
        completion(decodedTeams)
      }
    } catch let error {
      print(error)
    }
  }
}

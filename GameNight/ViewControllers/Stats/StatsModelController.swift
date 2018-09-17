//
//  StatsModelController.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

class StatsModelController {
  var players: [Player]?
  
  private var playersParser: PlayersDataParsing
  private var gamesParser: GameParsing
  
  private var playersData: [PlayerData] = []
  private var playerStats: [Int: PlayerStats] = [:]
  private var teams: [Int: Team] = [:]
  
  init(playersParser: PlayersDataParsing, gamesParser: GameParsing) {
    self.playersParser = playersParser
    self.gamesParser = gamesParser
  }
  
  func loadData(completion: @escaping ([Player]) -> Void) {
    
    let dispatchGroup = DispatchGroup()
    var playerArray = [Player]()
    
    dispatchGroup.enter()
    playersParser.players() { data in
      self.playersData = data
      dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    playersParser.stats() { stats in
      stats.forEach { self.playerStats.updateValue($0, forKey: $0.playerId)}
      dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    gamesParser.teams { teams in
      teams.forEach { self.teams.updateValue($0, forKey: $0.id)}
      dispatchGroup.leave()
    }
    
    playerArray = playersData.map {
      Player(player: $0,
             stats: self.playerStats[$0.id]!,
             team: self.teams[$0.teamId]!)
    }
    
    dispatchGroup.notify(queue: DispatchQueue.main) {
      completion(playerArray)
    }
  }
}

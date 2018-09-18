//
//  File.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

protocol GamesLoading: class {
  func loadData(completion: @escaping ([Game]) -> Void)
}

class GamesModelController: GamesLoading {
  
  var games: [Game]?
  
  private var gamesParser: GameParsing
  private var gamesData: [GameData] = []
  private var gameStates: [Int: GameState] = [:]
  private var teams: [Int: Team] = [:]
  
  init(gamesParser: GameParsing) {
    self.gamesParser = gamesParser
  }
  
  func loadData(completion: @escaping ([Game]) -> Void) {
    
    let dispatchGroup = DispatchGroup()
    var gamesArray = [Game]()
    
    dispatchGroup.enter()
    gamesParser.games { data in
      self.gamesData = data
      dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    gamesParser.states { states in
      states.forEach { self.gameStates.updateValue($0, forKey: $0.gameId)}
      dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    gamesParser.teams { teams in
      teams.forEach { self.teams.updateValue($0, forKey: $0.id)}
      dispatchGroup.leave()
    }
    
    
    gamesArray = gamesData.map {
      Game(game: $0,
           gameState: self.gameStates[$0.id],
           homeTeam: self.teams[$0.homeTeamId],
           awayTeam: self.teams[$0.awayTeamId])
    }
    
    dispatchGroup.notify(queue: DispatchQueue.main) {
      completion(gamesArray)
    }
  }
  
}

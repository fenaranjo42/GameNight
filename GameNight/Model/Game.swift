//
//  Game.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/13/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

class Game {
  let game: GameData
  var service: GameParsing
  var gameState: GameState?
  var homeTeam: Team?
  var awayTeam: Team?
  
  
  init(service: GameParsing, game: GameData) {
    self.game = game
    self.service = service
    setup()
  }
  
  func setup() {
    gameState = service.gameState(for: game.id)
    homeTeam = service.team(for: game.homeTeamId)
    awayTeam = service.team(for: game.awayTeamId)
  }
}


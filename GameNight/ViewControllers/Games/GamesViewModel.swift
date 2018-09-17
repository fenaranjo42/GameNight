//
//  GamesViewModel.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/13/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

class GamesViewModel {
  
  var games: [Game] = []
  var service: GameParsing
  
  init(service: GameParsing) {
    self.service = service
  }
  
  func getGames() {
    games = service.gamesData().map { Game(service: service, game: $0) }
  }
  
}

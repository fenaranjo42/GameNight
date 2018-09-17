//
//  StatsViewModel.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation
import PromiseKit

protocol StatsViewModelDelegate: class {
  func didFinishLoadingData()
}

class StatsViewModel {
  
  var players: [Player] = []
  var modelController: StatsModelController?
  weak var delegate: StatsViewModelDelegate?
  
  var playerService: PlayersDataParsing?
  var gamesService: GameParsing?
  
  init(playerService: PlayersDataParsing, gamesService: GameParsing) {
    self.playerService = playerService
    self.gamesService = gamesService
    modelController = StatsModelController(playersParser: playerService, gamesParser: gamesService)
  }
  
  func getPlayers() {
    modelController?.loadData { players in
      self.players = players
      self.delegate?.didFinishLoadingData()
    }
  }
}

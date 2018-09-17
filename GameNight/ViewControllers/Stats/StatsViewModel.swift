//
//  StatsViewModel.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/16/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

class StatsViewModel {
  
  var players: [Player] = []
  var stats: [PlayerStats] = []
  var service: PlayersDataParsing?
  
  init(service: PlayersDataParsing) {
    self.service = service
  }
  
  func getPlayers() {
    service?.players { players in
      self.players = players
    }
  }
  
  func getStats() {
    service?.stats { stats in
      self.stats = stats
    }
  }
}

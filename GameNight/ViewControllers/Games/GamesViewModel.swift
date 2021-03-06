//
//  GamesViewModel.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

protocol GamesViewModelDelegate: class {
  func didFinishLoadingData()
}

class GamesViewModel {
  
  var games: [Game] = []
  var service: GameParsing
  var modelController: GamesLoading?
  var dataSource: TableViewDataSource<Game>?
  weak var delegate: GamesViewModelDelegate?
  
  init(service: GameParsing) {
    self.service = service
    modelController = GamesModelController(gamesParser: service)
  }
  
  func getGames() {
    modelController?.loadData { games in
      self.games = games
      self.dataSource = .make(for: games)
      self.delegate?.didFinishLoadingData()
    }
  }
}

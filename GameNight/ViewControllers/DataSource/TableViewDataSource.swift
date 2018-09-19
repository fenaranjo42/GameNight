//
//  TableViewDataSource.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/18/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class TableViewDataSource<Model>: NSObject, UITableViewDataSource {
  typealias CellConfigurator = (Model, UITableViewCell) -> Void
  
  var models: [Model]
  private let reuseIdentifier: String
  private let cellConfigurator: CellConfigurator
  
  init(models: [Model], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
    self.models = models
    self.reuseIdentifier = reuseIdentifier
    self.cellConfigurator = cellConfigurator
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let model = models[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    cellConfigurator(model, cell)
    return cell
  }
}

extension TableViewDataSource where Model == Player {
  static func make(for players: [Player], reuseIdentifier: String = "StatsCell") -> TableViewDataSource {
    return TableViewDataSource(models: players, reuseIdentifier: reuseIdentifier) { (player, cell) in
      if let statsCell = cell as? StatsCell {
        statsCell.configure(for: player)
      }
      
    }
  }
}

extension TableViewDataSource where Model == Game {
  static func make(for games: [Game], reuseIdentifier: String = "GameCell") -> TableViewDataSource {
    return TableViewDataSource(models: games, reuseIdentifier: reuseIdentifier) { game, cell in
      if let gameCell = cell as? GameCell {
        gameCell.configure(with: game)
      }
    }
  }
}

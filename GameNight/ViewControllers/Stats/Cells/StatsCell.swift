//
//  StatsCell.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/16/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class StatsCell: UITableViewCell {

  @IBOutlet var nameCityLabel: UILabel!
  @IBOutlet var statsLabel: UILabel!
  @IBOutlet var nerdLabel: UILabel!
  
  func configure(for data: PlayerData) {
    
  }
}

struct PlayerData {
  var player: Player
  var team: Team
  var stats: Stats
}

struct Stats {
  var points: Int
  var rebounds: Int
  var assists: Int
  var nerd: Int
}

//
//  StatsCell.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class StatsCell: UITableViewCell {

  @IBOutlet var nameCityLabel: UILabel!
  @IBOutlet var statsLabel: UILabel!
  @IBOutlet var nerdLabel: UILabel!
  
  func configure(for player: Player) {
    nameCityLabel.text = "\(player.player.name) - \(player.team.abbreviation)"
    statsLabel.attributedText = NSAttributedString.attributedText(for: player.stats)
    nerdLabel.text = "\(player.stats.nerd.cleanString())"
  }
}

private extension NSAttributedString {
  static func attributedText(for stats: PlayerStats) -> NSAttributedString? {
    let boldSubString = "\(stats.points)Pts"
    let string = "\(boldSubString), \(stats.assists)Ast, \(stats.rebounds)Reb"
    let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold)]
    
    guard let range = string.range(of: boldSubString) else { return nil }
    
    let nsRange = string.nsRange(from: range)
    let attributedString = NSMutableAttributedString(string: string)
    attributedString.addAttributes(attribute, range: nsRange)
    return attributedString
  }
}

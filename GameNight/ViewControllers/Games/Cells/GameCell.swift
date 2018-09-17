//
//  GameCell.swift
//  Fanduel-Challenge
//
//  Created by Felipe Naranjo on 9/13/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

  @IBOutlet var awayTeamView: TeamView!
  @IBOutlet var homeTeamView: TeamView!
  @IBOutlet var stateView: GameStateView!
  
  var stateViewColor = UIColor.lightGray
  var state: ScoreState = ScoreState.tied {
    didSet {
      configureForState(state: state)
    }
  }
  
  
  func configure(with game: Game) {
    awayTeamView.setup(with: game.awayTeam?.name,
                       score: String(describing: game.gameState?.awayTeamScore ?? 0),
                       record: "")
    
    homeTeamView.setup(with: game.homeTeam?.name,
                       score: String(describing: game.gameState?.homeTeamScore ?? 0),
                       record: "")
    
    if let state = game.gameState?.scoreState {
      switch state {
      case .awayWinning:
        stateViewColor = UIColor.with(hex: game.awayTeam?.colorHex ?? "000000")
      case .homeWinning:
        stateViewColor = UIColor.with(hex: game.homeTeam?.colorHex ?? "000000")
      case .tied:
        stateViewColor = .lightGray
      }
    }    
    
    stateView.setup(with: game.gameState!, color: stateViewColor)
  }
  
  func configureForState(state: ScoreState) {
    
  }
  
}

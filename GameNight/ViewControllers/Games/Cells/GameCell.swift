//
//  GameCell.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {

  @IBOutlet var awayTeamView: TeamView!
  @IBOutlet var homeTeamView: TeamView!
  @IBOutlet var stateView: GameStateView!
  
  var stateViewColor = UIColor.lightGray
  var state: ScoreState = ScoreState.tied
  
  func configure(with game: Game) {
    let gameStarted = hasStarted(state: game.gameState)
    awayTeamView.setup(with: game.awayTeam,
                       score: String(describing: game.gameState?.awayTeamScore ?? 0),
                       hasStarted: gameStarted)
    
    homeTeamView.setup(with: game.homeTeam,
                       score: String(describing: game.gameState?.homeTeamScore ?? 0),
                       hasStarted: gameStarted)
    
    if let state = game.gameState?.scoreState {
      switch state {
      case .awayWinning:
        stateViewColor = UIColor.with(hex: game.awayTeam?.colorHex ?? "D6D6D6")
      case .homeWinning:
        stateViewColor = UIColor.with(hex: game.homeTeam?.colorHex ?? "D6D6D6")
      case .tied:
        stateViewColor = .lightGray
      }
    }    
    guard let state = game.gameState else { return }
    
    stateView.setup(with: state, color: stateViewColor)
  }
  
  private func hasStarted(state: GameState?) -> Bool {
    guard let status = state?.status else { return false }
    switch status {
    case .scheduled: return false
    default: return true
    }
  }
}

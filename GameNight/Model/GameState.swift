//
//  GameState.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/13/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

struct GameState {
  let id: Int
  let gameId: Int
  let homeTeamScore: Int?
  let awayTeamScore: Int?
  let broadcast: String
  let currentQuarter: Int?
  let timeLeft: String?
  let status: Status
  
  var scoreState: ScoreState {
    if let awayScore = awayTeamScore, let homeScore = homeTeamScore {
      if homeScore == awayScore {
        return .tied
      } else if homeScore > awayScore {
        return .homeWinning
      } else {
        return .awayWinning
      }
    }
    return .tied
  }
  
  enum Status: String {
    case inProgress = "InProgress"
    case final = "Final"
    case scheduled = "Scheduled"
  }
}

enum ScoreState {
  case tied
  case homeWinning
  case awayWinning
}

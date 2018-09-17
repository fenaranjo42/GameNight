//
//  GameState.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

enum ScoreState {
  case tied
  case homeWinning
  case awayWinning
}

struct GameState: Codable {
  let id: Int
  let gameId: Int
  let homeTeamScore: Int?
  let awayTeamScore: Int?
  let broadcast: String
  let currentQuarter: Int?
  let timeLeft: String?
  let startTime: String?
  let statusString: String
  
  var status: Status {
    return Status.value(for: statusString)
  }
  
  enum Status: String{
    case inProgress = "IN PROGRESS"
    case final = "FINAL"
    case scheduled = "SCHEDULED"
    
    static func value(for string: String) -> Status {
      switch string {
      case "IN_PROGRESS": return .inProgress
      case "FINAL": return .final
      case "SCHEDULED": return .scheduled
      default: return .scheduled
      }
    }
  }
  
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
}

extension GameState {
  enum CodingKeys: String, CodingKey {
    case id
    case gameId = "game_id"
    case homeTeamScore = "home_team_score"
    case awayTeamScore = "away_team_score"
    case broadcast
    case currentQuarter = "quarter"
    case timeLeft = "time_left_in_quarter"
    case statusString = "game_status"
    case startTime = "game_start"
  }
}


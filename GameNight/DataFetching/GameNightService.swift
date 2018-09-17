//
//  GameNightService.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/13/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

protocol GameParsing: class {
  func gamesData() -> [GameData]
  func gameState(for id: Int) -> GameState
  func team(for id: Int) -> Team
}

class GameNightService: GameParsing {
  
  func gamesData() -> [GameData] {
    let mockGameData = [GameData(id: 1, homeTeamId: 1, awayTeamId: 2, date: "1/1/2018"),
                        GameData(id: 2, homeTeamId: 3, awayTeamId: 4, date: "1/1/2018"),
                        GameData(id: 3, homeTeamId: 5, awayTeamId: 6, date: "1/1/2016"),
                        GameData(id: 4, homeTeamId: 2, awayTeamId: 3, date: "1/2/2018"),
                        GameData(id: 5, homeTeamId: 1, awayTeamId: 4, date: "1/2/2018"),
                        GameData(id: 6, homeTeamId: 6, awayTeamId: 1, date: "1/3/2016")]
    return mockGameData
  }
  
  func gameState(for id: Int) -> GameState {
    let mockStates = [GameState(id: 1, gameId: 1, homeTeamScore: 78, awayTeamScore: 77, broadcast: "ESPN", currentQuarter: 4, timeLeft: "10:20", status: .inProgress),
                      GameState(id: 2, gameId: 2, homeTeamScore: 10, awayTeamScore: 20, broadcast: "TNT", currentQuarter: 2, timeLeft: "1:00", status: .inProgress),
                      GameState(id: 3, gameId: 3, homeTeamScore: 100, awayTeamScore: 99, broadcast: "TNT", currentQuarter: 4, timeLeft: "0:00", status: .final),
                      GameState(id: 4, gameId: 4, homeTeamScore: 20, awayTeamScore: 30, broadcast: "ROOT", currentQuarter: 4, timeLeft: "10:20", status: .inProgress),
                      GameState(id: 5, gameId: 5, homeTeamScore: 120, awayTeamScore: 100, broadcast: "ESPN3", currentQuarter: 3, timeLeft: "0:00", status: .final),
                      GameState(id: 6, gameId: 6, homeTeamScore: nil, awayTeamScore: nil, broadcast: "ESPN3", currentQuarter: 4, timeLeft: "10:20", status: .scheduled)]
    return mockStates.filter { $0.id == id }.first!
  }
  
  func team(for id: Int) -> Team {
    let mockTeams = [Team(id: 1, name: "Lakers", city: "Los Angeles", record: "40-20", fullName: "Los Angeles Lakers", abbreviation: "LAL", colorHex: "#552582"),
                     Team(id: 2, name: "Cavaliers", city: "Cleveland", record: "5-45", fullName: "Cleveland Cavaliers", abbreviation: "CLE", colorHex: "#860038"),
                     Team(id: 3, name: "Clippers", city: "Los Angeles", record: "30-30", fullName: "Los Angeles Clippers", abbreviation: "LAC", colorHex: "#006BB6"),
                     Team(id: 4, name: "Warriors", city: "Golden State", record: "70-3", fullName: "Golden State Warriors", abbreviation: "GSW", colorHex: "#FDB927"),
                     Team(id: 5, name: "Hawks", city: "Atlanta", record: "50-5", fullName: "Atlanta Hawks", abbreviation: "ATL", colorHex: "#E21E3C"),
                     Team(id: 6, name: "Raptors", city: "Toronto", record: "15-50", fullName: "Toronto Raptors", abbreviation: "TOR", colorHex: "#CE1141")]
    return mockTeams.filter { $0.id == id }.first!
  }
}

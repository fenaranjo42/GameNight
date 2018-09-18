//
//  GamesViewModelTests.swift
//  GameNightTests
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import XCTest
@testable import GameNight

class GamesViewModelTests: XCTestCase {
  
  var cut: GamesViewModel!
  let service: GameParsing = MockGamesParsing()
  let mockModelController = MockGamesModelController()
  
  
  override func setUp() {
  cut = GamesViewModel(service: service)
  cut.modelController = mockModelController
  }

  override func tearDown() {
    
  }
  
  func test_WhenGetGamesIsCalled_itCallsControllersLoadData() {
    // Arrange
    // Act
    cut.getGames()
    
    // Assert
    XCTAssertTrue(mockModelController.loadDataCalled)
  }
  

}

class MockGamesModelController: GamesLoading {
  
  var loadCallTimes = 0
  
  var loadDataCalled: Bool {
    return loadCallTimes > 0
  }
  
  func loadData(completion: @escaping ([Game]) -> Void) {
    loadCallTimes += 1
  }
  
}

class MockGamesParsing: GameParsing {
  
  var gamesCallTimes = 0
  var statesCallTimes = 0
  var teamsCallTimes = 0
  
  var gamesCalled: Bool {
    return gamesCallTimes > 0
  }
  
  var statesCalled: Bool {
    return statesCallTimes > 0
  }
  
  var teamsCalled: Bool {
    return teamsCallTimes > 0
  }
  
  func games(completion: @escaping ([GameData]) -> Void) {
    gamesCallTimes += 1
    let games = [GameData]()
    completion(games)
  }
  
  func states(completion: @escaping ([GameState]) -> Void) {
    statesCallTimes += 1
    let states = [GameState]()
    completion(states)
  }
  
  func teams(completion: @escaping ([Team]) -> Void) {
    teamsCallTimes += 1
    let teams = [Team]()
    completion(teams)
  }
  
  
}

//
//  StatsModelControllerTests.swift
//  GameNightTests
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import XCTest
@testable import GameNight

class StatsModelControllerTests: XCTestCase {
  
  var cut: StatsModelController!
  let gameService = MockGamesParsing()
  let playerService = MockPlayersParsing()
  
  override func setUp() {
    cut = StatsModelController(playersParser: playerService, gamesParser: gameService)
  }
  
  override func tearDown() {
    
  }
  
  func test_WhenLoadDataIsCalled_itCallsPlayers() {
    // Arrange
    let e = expectation(description: "wait for completion")
    
    // Act
    cut.loadData { _ in
      e.fulfill()
    }
    wait(for: [e], timeout: 3)
    
    // Assert
    XCTAssertTrue(playerService.playersCalled)
  }
  
  func test_WhenLoadDataIsCalled_itCallsStats() {
    // Arrange
    let e = expectation(description: "wait for completion")
    
    // Act
    cut.loadData { _ in
      e.fulfill()
    }
    wait(for: [e], timeout: 3)
    
    // Assert
    XCTAssertTrue(playerService.statsCalled)
  }
  
  func test_WhenLoadDataIsCalled_itCallsTeams() {
    // Arrange
    let e = expectation(description: "wait for completion")
    
    // Act
    cut.loadData { _ in
      e.fulfill()
    }
    wait(for: [e], timeout: 3)
    
    // Assert
    XCTAssertTrue(gameService.teamsCalled)
  }

}

class MockPlayersParsing: PlayersDataParsing {
  
  var playersCallTimes = 0
  var statsCallTimes = 0
  
  var playersCalled: Bool {
    return playersCallTimes > 0
  }
  
  var statsCalled: Bool {
    return statsCallTimes > 0
  }
  
  func players(completion: @escaping ([PlayerData]) -> Void) {
    playersCallTimes += 1
    let data = [PlayerData]()
    completion(data)
  }
  
  func stats(completion: @escaping ([PlayerStats]) -> Void) {
    statsCallTimes += 1
    let stats = [PlayerStats]()
    completion(stats)
  }
}


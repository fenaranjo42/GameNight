//
//  StatsViewModelTests.swift
//  GameNightTests
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import XCTest
@testable import GameNight

class StatsViewModelTests: XCTestCase {
  
  var cut: StatsViewModel!
  let playerService = MockPlayersParsing()
  let gamesService = MockGamesParsing()
  let mockModelController = MockStatsModelController()

    override func setUp() {
      cut = StatsViewModel(playerService: playerService, gamesService: gamesService)
      cut.modelController = mockModelController
    }

    override func tearDown() {
      
    }
  
  func test_WhenGetPlayersIsCalled_itCallsControllersLoadData() {
    // Act
    cut.getPlayers()
    
    // Assert
    XCTAssertTrue(mockModelController.loadDataCalled)
  }

}

class MockStatsModelController: StatsLoading {
  
  var loadCallTimes = 0
  
  var loadDataCalled: Bool {
    return loadCallTimes > 0
  }
  
  func loadData(completion: @escaping ([Player]) -> Void) {
    loadCallTimes += 1
  }
  
}

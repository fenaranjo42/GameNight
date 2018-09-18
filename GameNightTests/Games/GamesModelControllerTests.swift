//
//  GamesModelControllerTests.swift
//  GameNightTests
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import XCTest
@testable import GameNight

class GamesModelControllerTests: XCTestCase {
  
  var cut: GamesModelController!
  let service = MockGamesParsing()

  override func setUp() {
    cut = GamesModelController(gamesParser: service)
  }

  override func tearDown() {
    
  }

  func test_WhenLoadDataIsCalled_itCallsGames() {
    // Arrange
    let e = expectation(description: "wait for completion")
    
    // Act
    cut.loadData { _ in
      e.fulfill()
    }
    wait(for: [e], timeout: 3)
    
    // Assert
    XCTAssertTrue(service.gamesCalled)
  }
  
  func test_WhenLoadDataIsCalled_itCallsStates() {
    // Arrange
    let e = expectation(description: "wait for completion")
    
    // Act
    cut.loadData { _ in
      e.fulfill()
    }
    wait(for: [e], timeout: 3)
    
    // Assert
    XCTAssertTrue(service.statesCalled)
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
    XCTAssertTrue(service.teamsCalled)
  }


}

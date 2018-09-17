//
//  GameStateView.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/14/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

import UIKit

class GameStateView: UIView {
  
  @IBOutlet var quarterLabel: UILabel!
  @IBOutlet var timeLabel: UILabel!
  @IBOutlet var broadcasterLabel: UILabel!
  @IBOutlet var awayIndicator: UIImageView!
  @IBOutlet var homeIndicator: UIImageView!
  
  func setup(with state: GameState, color: UIColor) {
    
    quarterLabel.text = Quarters.value(for: state.currentQuarter ?? 0)
    timeLabel.text = state.timeLeft
    broadcasterLabel.text = state.broadcast
    backgroundColor = color
    setIndicators(for: state.scoreState)
    awayIndicator.tintColor = color
    homeIndicator.tintColor = color
  }
  
  private func setIndicators(for scoreState: ScoreState) {
    
    switch scoreState {
    case .homeWinning:
      awayIndicator.isHidden = true
      homeIndicator.isHidden = false
    case .awayWinning:
      awayIndicator.isHidden = false
      homeIndicator.isHidden = true
    default:
      awayIndicator.isHidden = true
      homeIndicator.isHidden = true
    }
  }
}

enum Quarters: String {
  case first = "1st"
  case second = "2nd"
  case third = "3rd"
  case fourth = "4th"
  
  static func value(for number: Int) -> String {
    switch number {
    case 1: return Quarters.first.rawValue
    case 2: return Quarters.second.rawValue
    case 3: return Quarters.third.rawValue
    case 4: return Quarters.fourth.rawValue
    default: return ""
    }
  }
}

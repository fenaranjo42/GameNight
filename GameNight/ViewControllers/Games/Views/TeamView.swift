//
//  TeamView.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class TeamView: UIView {

  @IBOutlet var teamLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  @IBOutlet var recordLabel: UILabel!
  
  func setup(with team: Team?, score: String?, hasStarted: Bool = false) {
    
    teamLabel.text = team?.name ?? ""
    recordLabel.text = team?.record ?? ""
    
    if let score = score {
      scoreLabel.text = score
    }
    
    recordLabel.isHidden = hasStarted
    scoreLabel.isHidden = !hasStarted
  }

}

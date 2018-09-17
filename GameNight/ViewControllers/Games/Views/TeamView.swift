//
//  TeamView.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/13/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class TeamView: UIView {

  @IBOutlet var teamLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  
  func setup(with teamName: String?, score: String?, record: String?) {
    teamLabel.text = teamName ?? ""
    if let score = score {
      scoreLabel.text = score
    }
  }

}

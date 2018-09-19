//
//  StatsViewController.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  let viewModel = StatsViewModel(playerService: PlayersService(), gamesService: GameNightService())

    override func viewDidLoad() {
      super.viewDidLoad()
      viewModel.delegate = self
      viewModel.getPlayers()
      
    }

}

extension StatsViewController: StatsViewModelDelegate {
  func didFinishLoadingData() {
    tableView.dataSource = viewModel.dataSource
    tableView.reloadData()
  }
}

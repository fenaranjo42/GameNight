//
//  StatsViewController.swift
//  Fanduel-Challenge
//
//  Created by Felipe Naranjo on 9/13/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  let viewModel = StatsViewModel(service: PlayersService())

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        viewModel.getPlayers()
    }

}

extension StatsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.players.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatsCell", for: indexPath) as? StatsCell else {
      return UITableViewCell()
    }
    let player = viewModel.players[indexPath.row]
    cell.textLabel?.text = player.name
    return cell
  }
}

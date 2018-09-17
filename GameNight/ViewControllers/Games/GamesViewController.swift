//
//  GamesViewController.swift
//  Fanduel-Challenge
//
//  Created by Felipe Naranjo on 9/13/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  
  let viewModel = GamesViewModel(service: GameNightService())
  
  override func viewDidLoad() {
      super.viewDidLoad()
      tableView.dataSource = self
      viewModel.getGames()
  }
  

}

extension GamesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.games.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as? GameCell else {
      return UITableViewCell()
    }
    let game = viewModel.games[indexPath.row]
    game.setup()
    cell.configure(with: game)
    return cell
  }
}



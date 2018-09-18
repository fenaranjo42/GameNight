//
//  GamesViewController.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  
  let viewModel = GamesViewModel(service: GameNightService())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    viewModel.delegate = self
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
    cell.configure(with: game)
    return cell
  }
}

extension GamesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Sizes.gameCellHeight
  }
}

extension GamesViewController: GamesViewModelDelegate {
  func didFinishLoadingData() {
    tableView.reloadData()
  }
}


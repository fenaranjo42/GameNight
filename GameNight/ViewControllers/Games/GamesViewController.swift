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
    tableView.delegate = self
    viewModel.delegate = self
    viewModel.getGames()
  }

}

extension GamesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return Sizes.gameCellHeight
  }
}

extension GamesViewController: GamesViewModelDelegate {
  func didFinishLoadingData() {
    tableView.dataSource = viewModel.dataSource
    tableView.reloadData()
  }
}


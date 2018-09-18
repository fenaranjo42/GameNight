//
//  ContainerViewController.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
  
  var segmentedControl: UISegmentedControl!
  let segments: [String] = [.games, .stats]
  
  fileprivate lazy var stateViewController = GameStateViewController()

  override func viewDidLoad() {
    super.viewDidLoad()
    add(stateViewController)
    createSegmentedControl()
    updateView()
    navigationController?.navigationBar.barTintColor = Colors.background
  }
  
  @objc func onControl(_ control: UISegmentedControl) {
    updateView()
  }
  
  private func updateView() {
    switch segmentedControl.selectedSegmentIndex {
    case 0:
      showGames()
    case 1:
      showStats()
    default:
      break
    }
  }
  
  private func createSegmentedControl() {
    segmentedControl = UISegmentedControl(items: segments.map { return $0 })
    if let navBarSize = navigationController?.navigationBar.frame.size {
        segmentedControl.frame.size = CGSize(width: Sizes.screenWidth, height: navBarSize.height)
    }    
    segmentedControl.tintColor = Colors.blueTint
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.addTarget(self, action: #selector(ContainerViewController.onControl(_:)), for: .valueChanged)
    navigationItem.titleView = segmentedControl
  }

}

extension ContainerViewController {
  func showGames() {
    guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GamesViewController") as? GamesViewController else { return }
    stateViewController.transition(to: .games(vc))
  }
  
  func showStats() {
    guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StatsViewController") as? StatsViewController else { return }
    stateViewController.transition(to: .stats(vc))
  }
}

fileprivate extension String {
  static let games = "Games"
  static let stats = "Stats"
}

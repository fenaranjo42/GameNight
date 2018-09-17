//
//  GameStateViewController.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class GameStateViewController: UIViewController {
  
  private var state: State?
  private var shownViewController: UIViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if state == nil {
      transition(to: .loading)
    }
  }
  
  func transition(to newState: State) {
    shownViewController?.remove()
    let vc = viewController(for: newState)
    add(vc)
    shownViewController = vc
    state = newState
  }
  
}

extension GameStateViewController {
  enum State {
    case loading
    case games(UIViewController)
    case stats(UIViewController)
  }
}

private extension GameStateViewController {
  func viewController(for state: State) -> UIViewController {
    switch state {
    case .loading:
      return LoadingViewController()
    case .games(let viewController):
      return viewController
    case .stats(let viewController):
      return viewController
    }
  }
}


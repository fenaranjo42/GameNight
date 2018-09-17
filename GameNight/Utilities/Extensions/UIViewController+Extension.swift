//
//  UIViewController+Extension.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/14/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

extension UIViewController {
  func add(_ child: UIViewController) {
    addChild(child)
    view.addSubview(child.view)
    child.didMove(toParent: self)
  }
  
  func remove() {
    guard parent != nil else {
      return
    }
    
    willMove(toParent: nil)
    removeFromParent()
    view.removeFromSuperview()
  }
}

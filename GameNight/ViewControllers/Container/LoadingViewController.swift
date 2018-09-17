//
//  LoadingViewController.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
  
  let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    activityIndicator.startAnimating()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    activityIndicator.stopAnimating()
  }
  
}

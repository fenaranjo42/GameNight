//
//  Double+Extension.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

extension Double {
  func cleanString() -> String {
    let clean = String(format: "%g", self)
    return clean
  }
}


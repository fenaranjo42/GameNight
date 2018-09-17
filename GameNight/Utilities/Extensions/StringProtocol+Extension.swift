//
//  StringProtocol+Extension.swift
//  GameNight
//
//  Created by Felipe Naranjo on 9/17/18.
//  Copyright © 2018 Felipe Naranjo. All rights reserved.
//

import Foundation

extension StringProtocol where Index == String.Index {
  func nsRange(from range: Range<Index>) -> NSRange {
    return NSRange(range, in: self)
  }
}

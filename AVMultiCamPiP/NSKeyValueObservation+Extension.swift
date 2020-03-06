//
//  NSKeyValueObservation+Extension.swift
//  ONER for watch Extension
//
//  Created by HFY on 2019/12/4.
//  Copyright © 2019 HFY. All rights reserved.
//

import Foundation

extension NSKeyValueObservation {
    
    @discardableResult
    func invalidate(by observations: inout [NSKeyValueObservation]) -> NSKeyValueObservation {
        observations.append(self)
        return self
    }
    
}

extension Array where Element: NSKeyValueObservation {
    
    mutating func invalidate() {
        for keyValueObservation in self {
            keyValueObservation.invalidate()
        }
        removeAll()
    }
    
}

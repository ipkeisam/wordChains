//
//  QueueItem.swift
//  WordChains
//
//  Created by Sam, Ip on 5/20/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class QueueItem {
    var word : String
    var length : Int
    
    init(_ word : String, _ length : Int) {
        self.word = word
        self.length = length
    }
}

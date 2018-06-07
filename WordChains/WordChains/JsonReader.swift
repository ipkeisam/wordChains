//
//  JsonReader.swift
//  WordChains
//
//  Created by Sam, Ip on 5/19/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class JsonReader {
    
    func read(filename : String) -> Queue<String> {
        var words = Queue<String>()
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonResultArr = jsonResult as? Dictionary<String, AnyObject>{
                    for key in jsonResultArr.keys {
                        words.enqueue(key)
                    }
                }
            } catch {
                NSLog("Unable to read json file")
            }
        }
        return words
    }
}

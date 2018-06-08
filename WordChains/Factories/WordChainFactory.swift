//
//  WordChainFactory.swift
//  WordChains
//
//  Created by Sam, Ip on 5/20/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class WordChainFactory {
    
    var jsonReader : JsonReader
    var words : Queue<String>
    var wordChain = [String]()
    
    init() {
        jsonReader = JsonReader()
        words = jsonReader.read(filename: "english")
    }
    
    func create(_ start : String, _ end : String) -> [String] {
        return findWordChain(start, end)
    }
    
    func isNextWord(_ word1 : String, _ word2 : String) -> Int {
        
        if abs(word1.count - word2.count) > 1 {
            return 0
        }
        
        let word1Lower = word1.lowercased()
        let word2Lower = word2.lowercased()
        
        var count = 0
        let word1Arr = Array(word1Lower)
        let word2Arr = Array(word2Lower)
        let minLength = min(word1.count, word2.count)
        for i in 0..<minLength {
            if (word1Arr[i] != word2Arr[i]){
                count = count + 1
            }
            if (count > 1) {
                return 0
            }
        }
        if ((count == 1) && (word1.count == word2.count)) {
            return 2
        }
        if ((count == 0) && abs(word1.count - word2.count) == 1) {
            return 1
        }
        return 0
    }
    
    func isSimilar(_ word : String, _ target : String) -> Int {
        var score = Set(word).intersection(Set(target)).count
        let lenghtDiff = abs(word.count - target.count)
        score = score * (10 - lenghtDiff)
        return score
    }
    
    func findWordChain(_ start : String, _ end : String) -> [String] {

        wordChain.append(start)
        findWordChainUtil(start, end)
        
        while (wordChain.last != end) {
            words.enqueue(wordChain.last!)
            wordChain.removeLast()
            findWordChainUtil(start, end)
        }
        
        return wordChain
    }
    
    func findWordChainUtil(_ start : String, _ end : String) {
        var current = start
        var score = 1
        while (!words.isEmpty()) {
            let temp = words.peek()
            _ = words.dequeue()
            
            let tempScore = isNextWord(current, temp!) * isSimilar(temp!, end)
            if (!wordChain.contains(temp!)
                && tempScore >= score) {
                wordChain.append(temp!)
                current = temp!
                //print(current)
                score = tempScore
                if temp == end {
                    return
                }
            }
            else {
                words.enqueue(temp!)
            }
        }
    }
}

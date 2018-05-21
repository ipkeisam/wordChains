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
    var words : [String]
    
    init() {
        jsonReader = JsonReader()
        words = jsonReader.read(filename: "english")
    }
    
    func create(_ start : String, _ end : String) -> [String] {
        return findWordChain(start, end)
    }
    
    func isNextWord(_ word1 : String, _ word2 : String) -> Bool {
        
        if abs(word1.count - word2.count) > 1 {
            return false
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
                return false
            }
        }
        return ((count == 1) && (word1.count == word2.count))
    }
    
    func isSimilar(_ word : String, _ target : String) -> Bool {
        return word.rangeOfCharacter(from: CharacterSet(charactersIn: target)) != nil
    }
    
    func findWordChain(_ start : String, _ end : String) -> [String] {
        var startWord = start
        var endWord = end
        var wordChain = [String]()
        wordChain.append(startWord)
        
        if startWord.count > endWord.count {
            startWord = String(startWord.prefix(endWord.count))
            wordChain.append(startWord)
        }
        
        if startWord.count < endWord.count {
            endWord = String(endWord.prefix(startWord.count))
        }
        
        var queue = Queue<QueueItem>()
        let queueItem = QueueItem(startWord, 1)
        queue.enqueue(queueItem)
        
        while (!queue.isEmpty()) {
            
            let current = queue.peek()
            _ = queue.dequeue()
            
            for i in 0..<words.count {
                let temp = words[i]
                if (!wordChain.contains(temp)
                    && isNextWord((current?.word)!, temp)
                    && isSimilar(temp, endWord)) {
                    queueItem.word  = temp
                    queueItem.length = (current?.length)! + 1
                    queue.enqueue(queueItem)
                    wordChain.append(temp)
                    //print(temp)
                    
                    if temp == endWord {
                        if (endWord != end) {
                            wordChain.append(end)
                        }
                        return wordChain
                    }
                }
            }
        }
        if (endWord != end) {
            wordChain.append(end)
        }
        return wordChain
    }
}

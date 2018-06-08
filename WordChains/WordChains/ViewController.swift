//
//  ViewController.swift
//  WordChains
//
//  Created by Sam, Ip on 5/17/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startWord: UITextField!
    @IBOutlet weak var endWord: UITextField!
    @IBOutlet weak var output: UILabel!
    
    var wordChainFactory = WordChainFactory()
    
    @IBAction func generateWordChain(_ sender: Any) {
        let output = wordChainFactory.create(startWord.text!, endWord.text!)
        print(output)
        self.output.text = output.description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


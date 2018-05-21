//
//  ViewController.swift
//  WordChains
//
//  Created by Sam, Ip on 5/17/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var wordChainFactory = WordChainFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(wordChainFactory.create("Cat", "Dog"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


//
//  ViewController.swift
//  WordChains
//
//  Created by Sam, Ip on 5/17/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var jsonReader = JsonReader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let words = jsonReader.read(filename: "english")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


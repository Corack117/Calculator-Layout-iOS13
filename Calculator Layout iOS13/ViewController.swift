//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayLabel: UILabel!
    private var isFinishedTypeingNumber = true
    private var currentValue: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func calcButtonpressed(_ sender: Any) {
        isFinishedTypeingNumber = false
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double")
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let textButton = sender.currentTitle {
            if isFinishedTypeingNumber {
                displayLabel.text = textButton
                isFinishedTypeingNumber = false
            } else {
                displayLabel.text! += textButton
            }
        }
    }
    
}


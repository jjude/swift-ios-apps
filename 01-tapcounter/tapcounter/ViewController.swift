//
//  ViewController.swift
//  tapcounter
//
//  Created by Joseph Jude on 03/03/16.
//  Copyright © 2016 Joseph Jude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counter: UILabel!    

    @IBAction func startStop(sender: UIButton) {
        var currentCounter = Int(counter.text!) ?? 0
        currentCounter = currentCounter + 1
        
        counter.text = String(currentCounter)
    }


    @IBAction func reset(sender: UIButton) {
        counter.text = "0"
    }
}


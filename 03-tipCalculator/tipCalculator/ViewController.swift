//
//  ViewController.swift
//  tipCalculator
//
//  Created by Joseph Jude on 07/03/16.
//  Copyright © 2016 Joseph Jude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  @IBOutlet weak var billAmount: UITextField!
  @IBOutlet weak var tipPercent: UITextField!
  @IBOutlet weak var numberOfPeople: UITextField!
  
  @IBOutlet weak var totalAmount: UILabel!
  @IBOutlet weak var totalPerPerson: UILabel!
  
  // reduce tip by 1; don't go below 1
  @IBAction func reduceTip(sender: AnyObject) {
    let currentTipPercent = Int(tipPercent.text!) ?? 1
    // tip % shouldn't go below 1
    if currentTipPercent <= 1 {
      return
    }

    tipPercent.text = String(currentTipPercent - 1)
  }
  
  @IBAction func increaseTip(sender: AnyObject) {
    let currentTipPercent = Int(tipPercent.text!) ?? 1
    tipPercent.text = String(currentTipPercent + 1)
    
  }

  // reduce number of people by 1; don't below 1
  @IBAction func reduceNumberOfPeople(sender: AnyObject) {
    let currentNumberOfPeople = Int(numberOfPeople.text!) ?? 1
    
    //number of people shouldn't go below 1
    if currentNumberOfPeople <= 1 {
      return
    }
    
    numberOfPeople.text = String(currentNumberOfPeople - 1)
    
  }
  
  @IBAction func increaseNumberOfPeople(sender: AnyObject) {
    let currentNumberOfPeople = Int(numberOfPeople.text!) ?? 1
    numberOfPeople.text = String(currentNumberOfPeople + 1)
  }
  
  @IBAction func calculate(sender: AnyObject) {
    let billAmt = Double(billAmount.text!) ?? 0
    let numPeople = Int(numberOfPeople.text!) ?? 0
    let tip = Double(tipPercent.text!) ?? 0
        
    if billAmt == 0 || numPeople == 0 || tip == 0 {
      return
    }
    
    let total = billAmt + (billAmt * (tip / 100))
    totalAmount.text = String(total)
    totalPerPerson.text = String(total / Double(numPeople))
  }
  
  // dismiss number keypad when user clicks anywhere
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    self.view.endEditing(true)
  }
  
}


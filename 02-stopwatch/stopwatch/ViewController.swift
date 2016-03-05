//
//  ViewController.swift
//  stopwatch
//
//  Created by Joseph Jude on 05/03/16.
//  Copyright © 2016 Joseph Jude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var timerLabel: UILabel!
  // we want to enable/disable these buttons
  // so they are created as outlets as well
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var resetButton: UIButton!
  
  
  // initialise
  var counter = 0.0
  var timer = NSTimer()
  var isPlaying = false
  
  
  override func viewDidLoad() {
    // display initial value
    timerLabel.text = String(counter)
    super.viewDidLoad()
  }
  
  // enable, disable buttons
  // start timer & associate with update func
  @IBAction func startTimer(sender: AnyObject) {
    if (isPlaying){
      return
    }
    
    startButton.enabled = false
    resetButton.enabled = true
    
    timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self,
      selector: ("updateTimer"),
      userInfo: nil,
       repeats: true)
    
    isPlaying = true
  }
  
  // invalidate timer (stop timer events)
  // enable & disable buttons
  @IBAction func resetTimer(sender: AnyObject) {
    timer.invalidate()
    
    isPlaying = false
    counter = 0.0
    timerLabel.text = String(counter)
    
    startButton.enabled = true
    resetButton.enabled = true
  }
  
  
  // called at each timer tick
  // update timer label
  func updateTimer(){
    counter = counter + 0.1
    timerLabel.text = String(counter)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}


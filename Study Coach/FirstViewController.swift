//
//  FirstViewController.swift
//  Study Coach
//
//  Created by Liew Soon Hen on 02/02/2017.
//  Copyright © 2017 Liew Soon Hen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var secondsCounter = 50
    var minCounter = 0
    var hoursCounter = 0
    var timer = Timer()
    var isTimerOn = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timerLabel.text = "00:00:00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startStudySessionPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        secondsCounter += 1
        
        if (secondsCounter == 60) {
            minCounter += 1
            secondsCounter = 0
            
            if (minCounter == 60) {
                hoursCounter += 1
                minCounter = 0
                }
        }
        
        let secondsString = String(format: "%02d", secondsCounter)
        let minutesString = String(format: "%02d", minCounter)
        let hoursString = String(format: "%02d", hoursCounter)
        
        timerLabel.text = "\(hoursString):\(minutesString):\(secondsString)"
        
        
    }

}


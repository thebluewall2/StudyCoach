//
//  FirstViewController.swift
//  Study Coach
//
//  Created by Liew Soon Hen on 02/02/2017.
//  Copyright © 2017 Liew Soon Hen. All rights reserved.
//

import UIKit
import Foundation

let breakTime = 15
let lateTime = 23
let lateTimeEnd = 6

class HomeViewController: UIViewController {
    
    @IBOutlet weak var startStudyButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStudyButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var takeABreakButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var takeABreakButton: UIButton!
    @IBOutlet weak var endBreakButton: UIButton!
    @IBOutlet weak var endBreakButtomConstraint: NSLayoutConstraint!
    @IBOutlet weak var endStudySessionButton: UIButton!
    @IBOutlet weak var endStudySessionButtonBottomConstraint: NSLayoutConstraint!
    
    var secondsCounter = 0
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
        
        checkTime()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startStudyTimer), userInfo: nil, repeats: true)
        
        //slide the start study button upwards
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
            animations: {
                self.moveStartStudyButton(position: -100)
                self.moveTakeABreakButton(position: 500)
                self.moveEndStudyButton(position: 200)
                
                self.view.layoutIfNeeded()
        },
                completion: nil
        )
        
    }
    
    @IBAction func takeABreakButtonPressed(_ sender: Any) {
        stopTimer()
        
        //reset timer to preset break time
        
        secondsCounter = 0
        minCounter = breakTime
        hoursCounter = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startBreakTimer), userInfo: nil, repeats: true)
        
        //slide the end break button upwards
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
                       animations: {
                        self.moveTakeABreakButton(position: 1000)
                        self.moveEndBreakButton(position: 500)
                        
                        self.view.layoutIfNeeded()
        },
                       completion: nil
        )
        
    }
    
    @IBAction func endBreakButtonPressed(_ sender: Any) {
        stopTimer()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startStudyTimer), userInfo: nil, repeats: true)
        
        //slide the start study button upwards
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
                       animations: {
                        self.moveEndBreakButton(position: -100)
                        self.moveTakeABreakButton(position: 500)
                        
                        self.view.layoutIfNeeded()
        },
                       completion: nil
        )
        
    }
    
    @IBAction func endStudySessionButtonPressed(_ sender: Any) {
        stopTimer()
        timerLabel.text = "00:00:00"
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
                       animations: {
                        self.moveStartStudyButton(position: 153)
                        self.moveTakeABreakButton(position: -100)
                        self.moveEndStudyButton(position: -100)
                        self.moveEndBreakButton(position: -100)
                        
                        self.view.layoutIfNeeded()
        })
    }
    
    func moveStartStudyButton(position: CGFloat) {
        self.startStudyButton.center.y += position
        self.startStudyButtonTopConstraint.constant = position
    }
    
    func moveTakeABreakButton(position: CGFloat) {
        self.takeABreakButton.center.y = position
        self.takeABreakButtonBottomConstraint.constant = position
    }
    
    func moveEndBreakButton(position: CGFloat) {
        self.endBreakButton.center.y = position
        self.endBreakButtomConstraint.constant = position
    }
    
    func moveEndStudyButton(position: CGFloat) {
        self.endStudySessionButton.center.y = position
        self.endStudySessionButtonBottomConstraint.constant = position
    }
    
    func startStudyTimer() {
        secondsCounter += 1
        
        if (secondsCounter == 60) {
            minCounter += 1
            secondsCounter = 0
            
            if (minCounter == 60) {
                hoursCounter += 1
                minCounter = 0
                }
        }
    
        updateTimerLabel()
    }
    
    func startBreakTimer() {
        secondsCounter -= 1
        
        if (secondsCounter == -1) {
            minCounter -= 1
            secondsCounter = 59
            
            if (minCounter == -1) {
                hoursCounter -= 1
                minCounter = 59
            }
        }
        
        updateTimerLabel()
    }

    
    func updateTimerLabel() {
        let secondsString = String(format: "%02d", secondsCounter)
        let minutesString = String(format: "%02d", minCounter)
        let hoursString = String(format: "%02d", hoursCounter)
        
        timerLabel.text = "\(hoursString):\(minutesString):\(secondsString)"
    }
    
    func stopTimer() {
        timer.invalidate()
        
        secondsCounter = 0
        minCounter = 0
        hoursCounter = 0
    }
    
    func checkTime() {
        let now = Date()
        let maxTime = convertTime(hour: lateTime)
        let maxTimeEnd = convertTime(hour: lateTimeEnd)
        
        if now >= maxTime && now <= maxTimeEnd {
            let alertController = UIAlertController(title: "Past bedtime", message:
                "It's late. You should not be studying. Get a good night's sleep. :)", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func convertTime(hour: Int) -> Date {
        let thisDate = Date()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        var dateComponents = calendar.components(
            [NSCalendar.Unit.year,
             NSCalendar.Unit.month,
             NSCalendar.Unit.day],
            from: thisDate)
        
        dateComponents.hour = hour
        dateComponents.minute = 0
        dateComponents.second = 0
        
        let newDate = calendar.date(from: dateComponents)!
        return newDate
    }

}





















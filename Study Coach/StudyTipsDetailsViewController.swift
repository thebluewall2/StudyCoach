//
//  StudyTipsDetailsViewController.swift
//  Study Coach
//
//  Created by Liew Soon Hen on 08/02/2017.
//  Copyright © 2017 Liew Soon Hen. All rights reserved.
//

import UIKit

class StudyTipsDetailsViewController: UIViewController {
    
    var tipSelected = "Tip not selected."
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tipsTextLabel: UILabel!
    @IBOutlet weak var referencesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        switch tipSelected {
        case "musicTip" :
            generateMusicTip()
            
        case "practiceTestingTip" :
            generatePracticeTestingTip()
            
        default :
            titleLabel.text = "Tip not selected."
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateMusicTip() {
        titleLabel.text = "Music negatively affects studying"
        
        tipsTextLabel.text = ""
        
    }
    
    func generatePracticeTestingTip() {
        titleLabel.text = "practice"
    }
    
}





























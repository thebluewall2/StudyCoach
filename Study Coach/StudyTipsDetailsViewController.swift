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
        
        tipsTextLabel.text = "It has been found that many students prefer to study while listening to music." +
        " However, in a study done by Dr Nick Perham's 2010, it is shown that music can actually have negative " +
        "impacts on studying effectiveness. \n\nListening to music will diminish cognitive abilities as it is very easy" +
        " to be confused or distracted by the lyrics or music when trying to memorise things." + " Listening " +
        "to music can also cause your attention to shift towards the music rather than paying attention on " +
        "study materials."
        
        referencesLabel.text = "Nick Perham, Harriet Currie, Does listening to preferred music improve reading comprehension performance?, Applied Cognitive Psychology, 2014, 28, 2, 279"
        
        //reference link : http://onlinelibrary.wiley.com/doi/10.1002/acp.1731/abstract
    }
    
    func generatePracticeTestingTip() {
        titleLabel.text = "Practice testing is extremely important"
        
        tipsTextLabel.text = "Constantly testing yourself on what you've studied will greatly enhance " +
        "studying effectiveness. Try to ask yourself a few questions on the subject you've just studied " +
        "or practice test with another peer. \n\nPractice testing is very effective because it enhances how students " +
        "mentally organize information and greatly increases information retention and test performance (Hunt, 2006)." + " Practice testing is considered on of the most powerful studying techniques that can help any " +
        "student greatly increase his/her test performance."
        
        referencesLabel.text = "Hunt R. R. (2006). The concept of distinctiveness in memory research. In Hunt R. R., Worthen J. B. (Eds.), Distinctiveness and memory (pp. 3–25). New York, NY: Oxford University Press.\n" +
        "Dunlowsky, J., Rawson, K., Marsh, E., Nathan, M. and Willingham, D. (2013) ‘Improving Students’ " +
        "Learning With Effective Learning Techniques’, Psychological Science in the Public Interest, 14(1), pp. 4–58."
    }
    
}





























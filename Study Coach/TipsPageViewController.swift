//
//  TipsPageViewController.swift
//  Study Coach
//
//  Created by Liew Soon Hen on 10/02/2017.
//  Copyright © 2017 Liew Soon Hen. All rights reserved.
//

import UIKit

class TipsPageViewController: UITableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! StudyTipsDetailsViewController

        vc.tipSelected = segue.identifier!

    }
    
    
}

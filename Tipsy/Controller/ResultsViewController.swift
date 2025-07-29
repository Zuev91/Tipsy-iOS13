//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Aliaksandr Zuyeu on 29.07.25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalPerPerson: Double?
    var countOfPeople: Int?
    var tipPercentage: Double?
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%0.2f", totalPerPerson ?? 0)
        settingsLabel.text = "Split between \(String(countOfPeople ?? 0)) people, with \(String((tipPercentage ?? 0) * 100))% tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

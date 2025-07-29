//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
//    var tipsPercentage : Double = 0
//    var totalPerPerson : Double = 0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var pctButtonsStack: UIStackView!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        for view in pctButtonsStack!.arrangedSubviews as! [UIButton] {
            if view == sender {
                sender.isSelected = true
            } else {
                view.isSelected = false
            }
        }
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = getTotalPerPeson()
            destinationVC.countOfPeople = getCountOfPeople()
            destinationVC.tipPercentage = getTipsPercentage()
        }
    }
    
    func getTipsPercentage() -> Double {
        for view in pctButtonsStack!.arrangedSubviews as! [UIButton] {
            if view.isSelected {
                return (Double(view.titleLabel?.text?.dropLast(1) ?? "") ?? 0) / 100
            }
        }
        return 0
    }
    
    func getCountOfPeople() -> Int {
        return Int(splitNumberLabel.text ?? "1") ?? 1
    }
    
    func getTotalPerPeson() -> Double {
        let billTotal = Double(billTextField.text ?? "") ?? 0
        let tipsPercentage = getTipsPercentage()
        let countOfPeople = Double(getCountOfPeople())
        let totalPerPerson = (1.0 + tipsPercentage) * billTotal / countOfPeople
        return totalPerPerson
    }
}

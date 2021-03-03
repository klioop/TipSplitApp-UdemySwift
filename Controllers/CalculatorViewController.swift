//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipBrain = TipBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let buttonArr = [zeroPctButton, tenPctButton, twentyPctButton]
        buttonArr.forEach() {
            if ($0?.currentTitle == sender.currentTitle) {
                $0?.isSelected = true
                
                tipBrain.setTipPercent(sender.currentTitle!)
                print(sender.currentTitle!)
                tipBrain.changeToDecimal()
            } else {
                $0?.isSelected = false
            }
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        tipBrain.setNumPeople(sender.value)
        splitNumberLabel.text = tipBrain.getNumPeople()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tipBrain.setFinalSplit(billTextField.text!)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.amountSplit = tipBrain.getSplit()
            destinationVC.tipPct = tipBrain.getTipPercent()
            destinationVC.numPersons = tipBrain.getNumPeople()
        }
    }
}


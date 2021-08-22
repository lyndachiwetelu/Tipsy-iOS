//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipAmount: Float = 0.1
    var numberOfPeople: Int = 2
    var result: Float!

    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.currentTitle! {
        case "0%":
            tipAmount = 0.0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case "10%":
            tipAmount = 0.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        case "20%":
            tipAmount = 0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }
        
        
       
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let number = String(format: "%.0f", sender.value)
        splitNumberLabel.text = number
        numberOfPeople = Int(number) ?? 2
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = Double(billTextField.value(forKey: "text") as! String)
        result = self.calculateBillPerPerson(bill: Float(totalBill ?? 0.0), persons: numberOfPeople, tip: tipAmount)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func calculateBillPerPerson(bill: Float, persons: Int, tip:Float) -> Float {
        let totalAmount = bill + bill * tip
        let billPerPerson = totalAmount / Float(persons)
        return billPerPerson
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ResultsViewController
        destVC.numberOfPeople = numberOfPeople
        destVC.tipPercentage = Int( tipAmount * 100 )
        destVC.result = result
    }

}


//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Lynda Chiwetelu on 20.08.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result: Float!
    var numberOfPeople: Int!
    var tipPercentage: Int!

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", result)
        settingsLabel.text = "Split between \(numberOfPeople ?? 0) people, with \(tipPercentage ?? 0)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

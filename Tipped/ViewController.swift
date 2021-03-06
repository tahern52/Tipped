//
//  ViewController.swift
//  Tipped
//
//  Created by Taher on 2/4/19.
//  Copyright © 2019 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaults.set(1, forKey: "defaultTipIndex")
        defaults.synchronize()
        
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        tipSlider.value = defaults.float(forKey: "defaultTipIndex")
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: Any) {
        tipSlider.value = roundf(tipSlider.value)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipAmts = [0.1, 0.15, 0.18, 0.2, 0.25]
        
        // Get bill total
        let bill = Double(billField.text!) ?? 0
        
        // Calculate total and tip
        let tip = bill * tipAmts[Int(tipSlider.value)]
        let total = bill + tip
        
        // Set the labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}


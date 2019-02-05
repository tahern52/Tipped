//
//  SettingsViewController.swift
//  Tipped
//
//  Created by Taher on 2/4/19.
//  Copyright © 2019 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipDefaultControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        tipDefaultControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipIndex")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func setDefault(_ sender: Any) {
    defaults.set(tipDefaultControl.selectedSegmentIndex, forKey: "defaultTipIndex")
        
        defaults.synchronize()
    }
}

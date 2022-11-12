//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Avinash jindal on 07/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var showResult: UILabel!
    
    @IBOutlet weak var settingLable: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showResult.text = result
        settingLable.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    
    @IBAction func reCalculate(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

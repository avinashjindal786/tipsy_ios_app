//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var twntyButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var totalBill: UITextField!
    
    @IBOutlet weak var splitText: UILabel!
    
    var totBill = 0.0
    var tip = 0.10
    var numberOfPeople = 2
    var finalResult = "0.0"
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        totalBill.endEditing(true)
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twntyButton.isSelected = false
        sender.isSelected = true
        
        let bottonTitle = sender.currentTitle!
        let buttonAmount = String(bottonTitle.dropLast())
        let billAsNumber = Double(buttonAmount)!
        tip = billAsNumber / 100
        
    }
    
    @IBAction func personCounter(_ sender: UIStepper) {
        splitText.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculateButton(_ sender: UIButton) {
        
        let bill = totalBill.text!
        if bill != ""{
            totBill = Double(bill)!
            let result = totBill * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            let destinationWC = segue.destination as! ResultViewController
            destinationWC.result = finalResult
            destinationWC.tip = Int(tip * 100)
            destinationWC.split = numberOfPeople
        }
    }
    

}


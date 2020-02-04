//
//  ViewController.swift
//  Conversion Calculator App
//
//  Created by Collin Turkelson on 2/4/20.
//  Copyright © 2020 Collin Turkelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    
    let modes: [String] = ["Length","Volume"]
    var currentModeStr: String
    var currentModeIndex: Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let touch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(touch)
        
        currentModeIndex = 0
        currentModeStr = modes[currentModeIndex]
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func fromFieldTapped(_ sender: Any) {
        toTextField.text = ""
    }
    
    @IBAction func toFieldTapped(_ sender: UITextField) {
        fromTextField.text = ""
    }
    @IBAction func clearButton(_ sender: UIButton) {
        toTextField.text = ""
        fromTextField.text = ""
    }
    
    @IBAction func modeTapped(_ sender: Any) {
        currentModeIndex += 1
        currentModeStr = modes[currentModeIndex % 2]
        
        fromTextField.placeholder = "Enter \(currentModeStr) in"
    }
    
    @IBAction func calculateTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        if(toTextField.text! == "" && fromTextField.text! != ""){
            let yard = Double(fromTextField.text!)
            let newNum = Double(yard! * 0.9144)
            toTextField.text = String(newNum)
        }
        else if(fromTextField.text! == "" && toTextField.text! != ""){
            let meter = Double(toTextField.text!)
            let newNum = Double(meter! / 0.9144)
            fromTextField.text = String(newNum)
        }
        else{
            print("go away")
        }
        
        
    }
    
    
}


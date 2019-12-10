//
//  ViewController.swift
//  PasswordValidator
//
//  Created by KJEM on 10/12/2019.
//  Copyright © 2019 KJEM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func passwordChanged(_ sender: UITextField) {
        print(isValidated(sender.text!))
    }
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var lowercaseLabel: UILabel!
    
    @IBOutlet weak var uppercaseLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var specialLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func isValidated(_ password: String) -> Bool {
        var lowerCaseLetter: Bool = false
        var upperCaseLetter: Bool = false
        var digit: Bool = false
        var specialCharacter: Bool = false

        for char in password.unicodeScalars {
            if !lowerCaseLetter {
                lowerCaseLetter = CharacterSet.lowercaseLetters.contains(char)
                
            }
            if !upperCaseLetter {
                upperCaseLetter = CharacterSet.uppercaseLetters.contains(char)
            }
            if !digit {
                digit = CharacterSet.decimalDigits.contains(char)
            }

            if !specialCharacter {
                specialCharacter = CharacterSet.punctuationCharacters.contains(char)
            }
        }

        if  (lowerCaseLetter) {
            lowercaseLabel.text = "✅ Has a lowercase letter"
            lowercaseLabel.textColor = .green
            lowercaseLabel.sizeToFit()
        } else {
            lowercaseLabel.text = "Does not have a lowercase letter"
            lowercaseLabel.textColor = .red
            lowercaseLabel.sizeToFit()
        }
        
        if (upperCaseLetter) {
            uppercaseLabel.text = "✅ Has an uppercase letter"
            uppercaseLabel.textColor = .green
            uppercaseLabel.sizeToFit()
        } else {
            uppercaseLabel.text = "Does not have an uppercase letter"
            uppercaseLabel.textColor = .red
            uppercaseLabel.sizeToFit()
        }
        
        if  (specialCharacter) {
            specialLabel.text = "✅ Has a special character"
            specialLabel.textColor = .green
            specialLabel.sizeToFit()
        } else {
            specialLabel.text = "Does not have a special character"
            specialLabel.textColor = .red
            specialLabel.sizeToFit()
        }
        
        if  (digit) {
            numberLabel.text = "✅ Has a number"
            numberLabel.textColor = .green
            numberLabel.sizeToFit()
        } else {
            numberLabel.text = "Does not have a number"
            numberLabel.textColor = .red
            numberLabel.sizeToFit()
        }
        
        if lowerCaseLetter && upperCaseLetter && digit && specialCharacter {
            return true
        } else {
            return false
        }
    }
}


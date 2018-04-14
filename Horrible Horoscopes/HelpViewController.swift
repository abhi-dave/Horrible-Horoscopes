//
//  HelpViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever & Tyler Crago on 4/11/18.
//  Copyright © 2018 Sawyer Clever & Tyler Crago. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var signImageView: UIImageView!
    
    let birthdayPickerView = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Calls upon the function to create the date picker
        createBirthdayDatePicker()
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func createBirthdayDatePicker() {
        //Create toolbar for the picker view
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Create a 'done' button
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dismissKeyboard))
        toolbar.setItems([done], animated: false)
        
        //Add 'done' button to the toolbar
        birthdayTextField.inputAccessoryView = toolbar
        birthdayTextField.inputView = birthdayPickerView
        
        //Format picker view to: Month Day Year
        birthdayPickerView.datePickerMode = .date
    }
    
    //Dismisses keyboard by pressing the done button or clicking outside of the keyboard
    @objc func dismissKeyboard() {
        //Format the date and disinclude the time
        let format = DateFormatter()
        format.dateStyle = .medium
        format.timeStyle = .none
        let selectedDate = format.string(from: birthdayPickerView.date)

        //Calculates zodiac sign and inserts image and label into view controller
        getZodiacSign(formatter: format)
        
        //Display the selected birthday in the text field and stop editing
        birthdayTextField.text = "\(selectedDate)"
        self.view.endEditing(true)
    }
    
    //Calculates the user's zodiac sign from the birthday picker
    func getZodiacSign(formatter: DateFormatter) {
        //Stores month and day seperately for zodiac sign calculation
        formatter.dateFormat = "MM"
        let getMonth = formatter.string(from: self.birthdayPickerView.date)
        formatter.dateFormat = "dd"
        let getDay = formatter.string(from: self.birthdayPickerView.date)
        
        let day:Int = Int(getDay)!
        let month:Int = Int(getMonth)!
        
        switch(month) {
            case 1:
                if day >= 1 && day <= 19 {
                    signLabel.text = "Capricorn"
                    signImageView.image = UIImage(named: "capricorn")!
                } else if day >= 20 && day <= 31 {
                    signLabel.text = "Aquarius"
                    signImageView.image = UIImage(named: "aquarius")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 2:
                if day >= 1 && day <= 18 {
                    signLabel.text = "Aquarius"
                    signImageView.image = UIImage(named: "aquarius")!
                } else if day >= 19 && day <= 29 {
                    signLabel.text = "Pisces"
                    signImageView.image = UIImage(named: "pisces")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 3:
                if day >= 1 && day <= 20 {
                    signLabel.text = "Pisces"
                    signImageView.image = UIImage(named: "pisces")!
                } else if day >= 21 && day <= 31 {
                    signLabel.text = "Aries"
                    signImageView.image = UIImage(named: "aries")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 4:
                if day >= 1 && day <= 19 {
                    signLabel.text = "Aries"
                    signImageView.image = UIImage(named: "aries")!
                } else if day >= 20 && day <= 30 {
                    signLabel.text = "Taurus"
                    signImageView.image = UIImage(named: "taurus")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 5:
                if day >= 1 && day <= 20 {
                    signLabel.text = "Taurus"
                    signImageView.image = UIImage(named: "taurus")!
                } else if day >= 21 && day <= 31 {
                    signLabel.text = "Gemini"
                    signImageView.image = UIImage(named: "gemini")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 6:
                if day >= 1 && day <= 20 {
                    signLabel.text = "Gemini"
                    signImageView.image = UIImage(named: "gemini")!
                } else if day >= 21 && day <= 30 {
                    signLabel.text = "Cancer"
                    signImageView.image = UIImage(named: "cancer")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 7:
                if day >= 1 && day <= 22 {
                    signLabel.text = "Cancer"
                    signImageView.image = UIImage(named: "cancer")!
                } else if day >= 23 && day <= 31 {
                    signLabel.text = "Leo"
                    signImageView.image = UIImage(named: "leo")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 8:
                if day >= 1 && day <= 22 {
                    signLabel.text = "Leo"
                    signImageView.image = UIImage(named: "leo")!
                } else if day >= 23 && day <= 31 {
                    signLabel.text = "Virgo"
                    signImageView.image = UIImage(named: "virgo")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 9:
                if day >= 1 && day <= 22 {
                    signLabel.text = "Virgo"
                    signImageView.image = UIImage(named: "virgo")!
                } else if day >= 23 && day <= 30 {
                    signLabel.text = "Libra"
                    signImageView.image = UIImage(named: "libra")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 10:
                if day >= 1 && day <= 22 {
                    signLabel.text = "Libra"
                    signImageView.image = UIImage(named: "libra")!
                } else if day >= 23 && day <= 31 {
                    signLabel.text = "Scorpio"
                    signImageView.image = UIImage(named: "scorpio")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 11:
                if day >= 1 && day <= 21 {
                    signLabel.text = "Scorpio"
                    signImageView.image = UIImage(named: "scorpio")!
                } else if day >= 22 && day <= 30 {
                    signLabel.text = "Sagittarius"
                    signImageView.image = UIImage(named: "sagittarius")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            case 12:
                if day >= 1 && day <= 21 {
                    signLabel.text = "Sagittarius"
                    signImageView.image = UIImage(named: "sagittarius")!
                } else if day >= 22 && day <= 31 {
                    signLabel.text = "Capricorn"
                    signImageView.image = UIImage(named: "capricorn")!
                } else {
                    signLabel.text = "Error."
                }
                break;
            default:
                signLabel.text = "Error."
                break;
        }
    }
    
}

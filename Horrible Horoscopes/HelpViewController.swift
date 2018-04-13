//
//  HelpViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever on 4/11/18.
//  Copyright © 2018 Sawyer Clever. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var birthdayTextField: UITextField!
    
    let birthdayPickerView = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBirthdayDatePicker()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func createBirthdayDatePicker() {
        //Create toolbar for the picker view
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Create a 'done' button
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        toolbar.setItems([done], animated: false)
        
        //Add 'done' button to the toolbar
        birthdayTextField.inputAccessoryView = toolbar
        birthdayTextField.inputView = birthdayPickerView
        
        //Format picker view to: Month Day Year
        birthdayPickerView.datePickerMode = .date
    }
    
    
    
}

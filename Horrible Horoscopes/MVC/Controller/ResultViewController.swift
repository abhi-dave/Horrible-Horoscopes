//
//  ResultViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever & Tyler Crago on 4/13/18.
//  Copyright © 2018 Sawyer Clever & Tyler Crago. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var horoscopeLabel: UILabel!
    
    //FOR TESTING ONLY vvvvv
    @IBOutlet weak var testingLabel: UILabel!
    
    //Holds value of initial zodiac selection
    var zodiacSelection:String?
    
    //Default values of user responses that will be updated with information from the previous scene
    var responses = [
        [1, 0],
        [2, 0],
        [3, 0],
        [4, 0],
        [5, 0]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Gets the user associated zodiac sign image and name for display
        signImageView.image = UIImage(named: zodiacSelection!.lowercased())
        signLabel.text = zodiacSelection
        
        //FOR TESTING ONLY vvvvv
        testingLabel.text = "\(responses[0][1]), \(responses[1][1]), \(responses[2][1]), \(responses[3][1]), \(responses[4][1])"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

//
//  QuestionViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever & Tyler Crago on 4/13/18.
//  Copyright © 2018 Sawyer Clever & Tyler Crago. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
        
    //Integer that is used to advance questions
    var status = 0
    
    var zodiacSelection:String?
    
    //Multidimensional array to hold question number as well as the associated question
    let question = [
        [1, "Question 1", "Sample Question One"],
        [2, "Question 2", "Sample Question Two"],
        [3, "Question 3", "Sample Question Three"],
        [4, "Question 4", "Sample Question Four"],
        [5, "Question 5", "Sample Question Five"]
    ]
    
    //Multidimensional array to hold question number as well as the answers associated with that question
    let answer = [
        [1, "A. Sample Answer", "B. Sample Answer", "C. Sample Answer", "D. Sample Answer"],
        [2, "A. Sample Answer", "B. Sample Answer", "C. Sample Answer", "D. Sample Answer"],
        [3, "A. Sample Answer", "B. Sample Answer", "C. Sample Answer", "D. Sample Answer"],
        [4, "A. Sample Answer", "B. Sample Answer", "C. Sample Answer", "D. Sample Answer"],
        [5, "A. Sample Answer", "B. Sample Answer", "C. Sample Answer", "D. Sample Answer"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(zodiacSelection!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

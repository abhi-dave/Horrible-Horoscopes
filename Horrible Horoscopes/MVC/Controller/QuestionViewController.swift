//
//  QuestionViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever & Tyler Crago on 4/13/18.
//  Copyright © 2018 Sawyer Clever & Tyler Crago. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
        
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    //Integer that is used to advance questions
    var status = 0
    
    //Integer that handles checking for a user response
    var response:Int?
    
    //Holds value of initial zodiac selection
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
        [1, "A. Sample Answer1", "B. Sample Answer1", "C. Sample Answer1", "D. Sample Answer1"],
        [2, "A. Sample Answer2", "B. Sample Answer2", "C. Sample Answer2", "D. Sample Answer2"],
        [3, "A. Sample Answer3", "B. Sample Answer3", "C. Sample Answer3", "D. Sample Answer3"],
        [4, "A. Sample Answer4", "B. Sample Answer4", "C. Sample Answer4", "D. Sample Answer4"],
        [5, "A. Sample Answer5", "B. Sample Answer5", "C. Sample Answer5", "D. Sample Answer5"],
    ]
    
    //Multidimensional array that stores the users responses
    var responses = [
        [1, 0],
        [2, 0],
        [3, 0],
        [4, 0],
        [5, 0]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets initial question and answer properties
        questionNumberLabel.text = question[0][1] as? String
        questionLabel.text = question[0][2] as? String
        answerAButton.setTitle(answer[0][1] as? String, for: .normal)
        answerBButton.setTitle(answer[0][2] as? String, for: .normal)
        answerCButton.setTitle(answer[0][3] as? String, for: .normal)
        answerDButton.setTitle(answer[0][4] as? String, for: .normal)
        
        //Set initial value of the error label to a blank string
        errorLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Used to select a single button
    func buttonSelect(btn: UIButton) {
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.borderWidth = 2
    }
    
    //Used to deselect buttons when changing resposne
    func buttonDeselect(btn1: UIButton, btn2: UIButton, btn3: UIButton) {
        btn1.layer.borderColor = UIColor.white.cgColor
        btn1.layer.borderWidth = 0
        btn2.layer.borderColor = UIColor.white.cgColor
        btn2.layer.borderWidth = 0
        btn3.layer.borderColor = UIColor.white.cgColor
        btn3.layer.borderWidth = 0
    }
    
    //Used to deselect all buttons upon advancing to a new question
    func resetPreviousButtonSelection(btn1: UIButton, btn2: UIButton, btn3: UIButton, btn4: UIButton) {
        btn1.layer.borderColor = UIColor.white.cgColor
        btn1.layer.borderWidth = 0
        btn2.layer.borderColor = UIColor.white.cgColor
        btn2.layer.borderWidth = 0
        btn3.layer.borderColor = UIColor.white.cgColor
        btn3.layer.borderWidth = 0
        btn4.layer.borderColor = UIColor.white.cgColor
        btn4.layer.borderWidth = 0
    }
    
    //Handles the action of clicking Answer A
    @IBAction func selectedA(_ sender: Any) {
        buttonSelect(btn: answerAButton)
        buttonDeselect(btn1: answerBButton!, btn2: answerCButton!, btn3: answerDButton!)
        response = 1
        errorLabel.text = ""
    }
    
    //Handles the action of clicking Answer B
    @IBAction func selectedB(_ sender: Any) {
        buttonSelect(btn: answerBButton)
        buttonDeselect(btn1: answerAButton!, btn2: answerCButton!, btn3: answerDButton!)
        response = 2
        errorLabel.text = ""
    }
    
    //Handles the action of clicking Answer C
    @IBAction func selectedC(_ sender: Any) {
        buttonSelect(btn: answerCButton)
        buttonDeselect(btn1: answerAButton!, btn2: answerBButton!, btn3: answerDButton!)
        response = 3
        errorLabel.text = ""
    }
    
    //Handles the action of clicking Answer D
    @IBAction func selectedD(_ sender: Any) {
        buttonSelect(btn: answerDButton)
        buttonDeselect(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!)
        response = 4
        errorLabel.text = ""
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        //Makes sure that an answer is selected before advancing questions
        if response != nil {
            //Checks the status variable to further advance questions, set properties, and store answers
            switch(status) {
                case 0:
                    resetPreviousButtonSelection(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerDButton!)
                    questionNumberLabel.text = question[1][1] as? String
                    questionLabel.text = question[1][2] as? String
                    answerAButton.setTitle(answer[1][1] as? String, for: .normal)
                    answerBButton.setTitle(answer[1][2] as? String, for: .normal)
                    answerCButton.setTitle(answer[1][3] as? String, for: .normal)
                    answerDButton.setTitle(answer[1][4] as? String, for: .normal)
                    responses[0][1] = response!
                    status += 1
                    response = nil
                    break;
                case 1:
                    resetPreviousButtonSelection(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerDButton!)
                    questionNumberLabel.text = question[2][1] as? String
                    questionLabel.text = question[2][2] as? String
                    answerAButton.setTitle(answer[2][1] as? String, for: .normal)
                    answerBButton.setTitle(answer[2][2] as? String, for: .normal)
                    answerCButton.setTitle(answer[2][3] as? String, for: .normal)
                    answerDButton.setTitle(answer[2][4] as? String, for: .normal)
                    responses[1][1] = response!
                    status += 1
                    response = nil
                    break;
                case 2:
                    resetPreviousButtonSelection(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerDButton!)
                    questionNumberLabel.text = question[3][1] as? String
                    questionLabel.text = question[3][2] as? String
                    answerAButton.setTitle(answer[3][1] as? String, for: .normal)
                    answerBButton.setTitle(answer[3][2] as? String, for: .normal)
                    answerCButton.setTitle(answer[3][3] as? String, for: .normal)
                    answerDButton.setTitle(answer[3][4] as? String, for: .normal)
                    responses[2][1] = response!
                    status += 1
                    response = nil
                    break;
                case 3:
                    resetPreviousButtonSelection(btn1: answerAButton!, btn2: answerBButton!, btn3: answerCButton!, btn4: answerDButton!)
                    questionNumberLabel.text = question[4][1] as? String
                    questionLabel.text = question[4][2] as? String
                    answerAButton.setTitle(answer[4][1] as? String, for: .normal)
                    answerBButton.setTitle(answer[4][2] as? String, for: .normal)
                    answerCButton.setTitle(answer[4][3] as? String, for: .normal)
                    answerDButton.setTitle(answer[4][4] as? String, for: .normal)
                    responses[3][1] = response!
                    status += 1
                    response = nil
                    break;
                case 4:
                    responses[4][1] = response!
                    performSegue(withIdentifier: "questionToResult", sender: self)
                    break;
                default:
                    break;
            }
        } else {
            errorLabel.text = "Please select an answer to continue."
        }
    }
    
    //Sends the initial zodiac sign selection and answer selections to the result view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultViewController {
            destination.zodiacSelection = zodiacSelection
            destination.responses[0][1] = responses[0][1]
            destination.responses[1][1] = responses[1][1]
            destination.responses[2][1] = responses[2][1]
            destination.responses[3][1] = responses[3][1]
            destination.responses[4][1] = responses[4][1]
        }
    }
    

}

//
//  HomeViewController.swift
//  Horrible Horoscopes
//
//  Created by Sawyer Clever & Tyler Crago on 4/11/18.
//  Copyright © 2018 Sawyer Clever & Tyler Crago. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var zodiacCollectionView: UICollectionView!
    @IBOutlet weak var errorLabel: UILabel!
    
    //String that handles checking for a zodiac selection
    var selection:String?
    var arrZodiac: [ZodiacSign] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        arrZodiac = ZodiacSign.horoscopeData()
        zodiacCollectionView.dataSource = self
        zodiacCollectionView.delegate = self
        
        //Set initial value of the error label to a blank string
        errorLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Gets the amount of cells to display in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrZodiac.count
    }
    
    //Displays the sign label and sign image for each cell counted in the previous method
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.zodiacSign = arrZodiac[indexPath.row]
        
        return cell
    }
    
    //Handles selection of an item within the zodiac sign collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)
        selectedCell?.layer.borderColor = UIColor.red.cgColor
        selectedCell?.layer.borderWidth = 2
        
        errorLabel.text = ""
        selection = arrZodiac[indexPath.row].name
    }
    
    //Handles the deselection of an item within the zodiac sign collection view
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let deselectedCell = collectionView.cellForItem(at: indexPath)
        deselectedCell?.layer.borderColor = UIColor.white.cgColor
        deselectedCell?.layer.borderWidth = 0
    }
    
    //Makes sure that a zodiac sign is selected before advancing to the questionnaire
    @IBAction func nextPressed(_ sender: Any) {
        if selection != nil {
            errorLabel.text = ""
            performSegue(withIdentifier: "homeToQuestion", sender: self)
        } else {
            errorLabel.text = "Please select a sign to continue."
        }
    }
    
    //Creates an unwinding segue for both exiting the help menu and trying again
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
    }
    
    //Sends the initial zodiac sign selection to the question view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuestionViewController {
            destination.zodiacSelection = selection
        }
    }
    
}


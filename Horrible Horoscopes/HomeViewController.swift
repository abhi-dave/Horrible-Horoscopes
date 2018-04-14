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
    
    //String that handles checking for a zodiac selection
    var selection:String?
    
    //Array that holds the names of the zodiac signs
    let sign = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    
    //Array that holds the images of the zodiac signs
    let signImage: [UIImage] = [
        UIImage(named: "aries")!,
        UIImage(named: "taurus")!,
        UIImage(named: "gemini")!,
        UIImage(named: "cancer")!,
        UIImage(named: "leo")!,
        UIImage(named: "virgo")!,
        UIImage(named: "libra")!,
        UIImage(named: "scorpio")!,
        UIImage(named: "sagittarius")!,
        UIImage(named: "capricorn")!,
        UIImage(named: "aquarius")!,
        UIImage(named: "pisces")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zodiacCollectionView.dataSource = self
        zodiacCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Gets the amount of cells to display in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sign.count
    }
    
    //Displays the sign label and sign image for each cell counted in the previous method
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.signLabel.text = sign[indexPath.item]
        cell.signImageView.image = signImage[indexPath.item]
        
        return cell
    }
    
    //Handles selection of an item within the zodiac sign collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)
        selectedCell?.layer.borderColor = UIColor.red.cgColor
        selectedCell?.layer.borderWidth = 2
        
        selection = sign[indexPath.item]
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
            performSegue(withIdentifier: "homeToQuestion", sender: self)
        } else {
            /*********Insert Selection Alert**********/
            print("No Selection Made")
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


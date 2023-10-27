//
//  ViewController.swift
//  savingNotes
//
//  Created by TYLER MOK on 10/26/23.
//

import UIKit

public class Player : Encodable{
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
    
    
}

class ViewController: UIViewController {
    
    
    //  #1 creating a reference to the phone creating a variable you can save too
    let defaults = UserDefaults.standard
    
    var name = ""
    
    var score = 0
    
    var namesArray : [String] = ["Jake", "Mason", "Noel", "Oliver"]
    
    var player2 = Player(name: "John", score: 0)

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    @IBOutlet weak var scoreOutlet: UITextField!
    
    @IBOutlet weak var namesArrayOutlet: UITextField!
    
    @IBOutlet weak var playerScoreOutlet: UITextField!
    
    @IBOutlet weak var playerInformationLabel: UILabel!
    
    @IBOutlet weak var playerNameOutlet: UITextField!
    
    @IBOutlet weak var playerInformationLabel2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // #3 getting value "TheName" from the phone and storing into name
        // ?? says if its nill then set name as ""
       name = defaults.string(forKey: "TheName") ?? ""
        nameLabel.text = name
        
        score = defaults.integer(forKey: "Score")
        nameLabel.text = name + " " + "\(score)"
        
       // namesArray = defaults.string(forKey: "newNames")
        var tempPlayer = defaults.object(forKey: "MasterChief")
        if let tp = tempPlayer as? Player
        {
            player2 = tp
            
            playerInformationLabel.text = player2.name
            playerInformationLabel2.text = "\(player2.score)"
        }
            }


    
    @IBAction func saveNameButton(_ sender: Any) {
        
        var name = nameOutlet.text!
        // #2 saving a string to the phone, key vairable name for text on the phone
        defaults.set(name, forKey: "TheName")
    }
    
    
    @IBAction func saveScoreButton(_ sender: Any) {
        
        var score = Int(scoreOutlet.text!)!
        defaults.set(score, forKey: "Score")
    }
    
    
    @IBAction func addNameButton(_ sender: Any) {
        namesArray.append(namesArrayOutlet.text!)
    }
    
    
    @IBAction func saveNamesButton(_ sender: Any) {
        var newName = namesArrayOutlet.text!
        defaults.set(newName, forKey: "newNames")
    }
    
    
    @IBAction func savePlayerButton(_ sender: Any) {
        var name1 = playerNameOutlet.text!
        var score1 = playerScoreOutlet.text!
        if let p = Int(score1)
        {
            var player = Player(name: name1, score: p)
            defaults.set(player, forKey: "MasterChief")
        }
        
        
        
    }
}


//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Andrei Pirogov on 2022-12-01.
//

import UIKit

class ViewController: UIViewController {
    
    var row1Square1Button : String?
    var playerTurn : String = "Player X"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func row1Square1Pressed(_ sender: UIButton) {
   //     sender.setTitle("O", for: .normal)
  //      sender.titleLabel?.font = UIFont(name: "Helvetica", size: 80)
        PlayerMarksSpot(sender: sender)
        
        row1Square1Button = sender.titleLabel?.text
        print(row1Square1Button ?? "")
    }
    
    @IBAction func row1Square2Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
    }
    
    @IBAction func row1Square3Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
    }
    
    
    
    
    
    
    func PlayerMarksSpot(sender: UIButton){
        if playerTurn == "Player O"{
            sender.setTitle("O", for: .normal)
                    sender.titleLabel?.font = UIFont(name: "Helvetica", size: 80)
            playerTurn = "Player X"
            sender.isEnabled = false
        }else if playerTurn == "Player X"{
            sender.setTitle("X", for: .normal)
                    sender.titleLabel?.font = UIFont(name: "Helvetica", size: 80)
            playerTurn = "Player O"
            sender.isEnabled = false
        }
        
        
    }
    
    
}


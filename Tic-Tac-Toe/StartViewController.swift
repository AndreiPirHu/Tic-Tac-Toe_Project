//
//  StartViewController.swift
//  Tic-Tac-Toe
//
//  Created by Andrei Pirogov on 2022-12-06.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var player1NameTextField: UITextField!
    
    @IBOutlet weak var player2NameTextField: UITextField!
    
    
    let segueToGameStart = "segueToGameStart"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }
    
    
    
    @IBAction func StartGameButtonPressed(_ sender: UIButton) {
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToGameStart{
            if let destinationVC = segue.destination as? ViewController{
                
                destinationVC.playerX = player1NameTextField.text ?? "Player 1"
                destinationVC.playerO = player2NameTextField.text ?? "Player 2"
            }
        }
    }

}

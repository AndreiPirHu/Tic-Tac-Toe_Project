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
                
                if player1NameTextField.text == ""{
                    player1NameTextField.text = "Player X"
                }
                
                if player2NameTextField.text == ""{
                    player2NameTextField.text = "Player O"
                }
                
                destinationVC.playerX = player1NameTextField.text ?? "Player X"
                destinationVC.playerO = player2NameTextField.text ?? "Player O"
            }
        }
    }

}

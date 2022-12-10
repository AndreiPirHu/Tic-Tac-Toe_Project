//
//  WinScreenViewController.swift
//  Tic-Tac-Toe
//
//  Created by Andrei Pirogov on 2022-12-10.
//

import UIKit

class WinScreenViewController: UIViewController {

    @IBOutlet weak var winnerNameLabel: UILabel!
    
    var segueToRematch = "SegueToRematch"
    
    var winnerName : String?
    var playerX : String?
    var playerO : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        winnerNameLabel.text = winnerName ?? ""
        
        
    }
    
// Sends the player names back for a rematch
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToRematch{
            if let destinationVC = segue.destination as? ViewController{
                destinationVC.playerX = playerX
                destinationVC.playerO = playerO
            }
        }
    }
    

}

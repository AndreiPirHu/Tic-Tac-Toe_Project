//
//  WinScreenViewController.swift
//  Tic-Tac-Toe
//
//  Created by Andrei Pirogov on 2022-12-10.
//

import UIKit

class WinScreenViewController: UIViewController {

    @IBOutlet weak var winnerNameLabel: UILabel!
    
    @IBOutlet weak var playerXScoreNameLabel: UILabel!
    
    @IBOutlet weak var playerOScoreNameLabel: UILabel!
    
    @IBOutlet weak var playerXScoreLabel: UILabel!
    
    @IBOutlet weak var playerOScoreLabel: UILabel!
    
    
    var segueToRematch = "SegueToRematch"
    
    var computerIsActive = false
    
    var winnerName : String?
    var playerX : String?
    var playerO : String?
    
    var playerXScore : Int?
    var playerOScore : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //displays the right winner name
        winnerNameLabel.text = winnerName ?? ""
        
        //displays the correct player names and scores
        playerXScoreNameLabel.text = playerX
        playerOScoreNameLabel.text = playerO
        playerXScoreLabel.text = String(playerXScore ?? 0)
        playerOScoreLabel.text = String(playerOScore ?? 0)
        
    }
    
// Sends the player names and score back for a rematch
    // checks if the computer was active and keeps it active
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToRematch{
            if let destinationVC = segue.destination as? ViewController{
                destinationVC.playerX = playerX
                destinationVC.playerO = playerO
                destinationVC.playerXScore = playerXScore ?? 0
                destinationVC.playerOScore = playerOScore ?? 0
                destinationVC.computerIsActive = computerIsActive
            }
        }
    }
    

}

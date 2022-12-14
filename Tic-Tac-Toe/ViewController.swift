//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Andrei Pirogov on 2022-12-01.
//

import UIKit

class ViewController: UIViewController {
    
    var row1Square1Button : String?
    var row1Square2Button : String?
    var row1Square3Button : String?
    var row2Square1Button : String?
    var row2Square2Button : String?
    var row2Square3Button : String?
    var row3Square1Button : String?
    var row3Square2Button : String?
    var row3Square3Button : String?
    
    @IBOutlet weak var playerXScoreNameLabel: UILabel!
    
    @IBOutlet weak var playerOScoreNameLabel: UILabel!
    
    
    @IBOutlet weak var playerXScoreLabel: UILabel!
    
    @IBOutlet weak var playerOScoreLabel: UILabel!
    
    
    var playerTurn : String = "Player X"
    var playerX : String?
    var playerO : String?
    var roundWinner : String?
    
    var playerXScore : Int = 0
    var playerOScore : Int = 0
    
    let segueToWinScreen = "SegueToWinScreen"

    @IBOutlet weak var playerTurnLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //sets the initial player turn to player X
        PlayerTurnDisplayTracker(name: playerX ?? "Player X")
        
        playerXScoreNameLabel.text = playerX
        
        playerOScoreNameLabel.text = playerO
        
        playerXScoreLabel.text = String(playerXScore)
        
        playerOScoreLabel.text = String(playerOScore)
        
        
    }
    // sends the winner name to winning screen and also both player names and score for a rematch
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWinScreen{
            if let destinationVC = segue.destination as? WinScreenViewController{
                destinationVC.winnerName = roundWinner
                destinationVC.playerX = playerX
                destinationVC.playerO = playerO
                destinationVC.playerXScore = playerXScore
                destinationVC.playerOScore = playerOScore
            }
        }
    }
    
    // sets viewcontroller to winscreen
    func GoToWinScreen(){
        performSegue(withIdentifier: segueToWinScreen, sender: self)
    }
    
    //sets the roundwinner for the winscreen and adds one point to the winner score
    func SetRoundWinner(name: String){
        roundWinner = "\(name) wins!"
        if name == playerX{
            playerXScore += 1
        } else{
            playerOScore += 1
        }
    }
    
    // Tracks all the win conditions for both players
    //adds 1 score to winner
    func WinConditionTracker(){
        switch(row1Square1Button, row1Square2Button, row1Square3Button, row2Square1Button, row2Square2Button, row2Square3Button, row3Square1Button, row3Square2Button,row3Square3Button){
            
            //Win conditions for player X
            //sets the name of the winner to be sent to the next viewcontroller
            //goes to the next viewcontroller
        case("X","X", "X", _, _, _, _, _, _):
          SetRoundWinner(name: playerX ?? "")
            GoToWinScreen()
        case(_, _, _, "X", "X", "X", _, _, _):
            SetRoundWinner(name: playerX ?? "")
            GoToWinScreen()
        case(_, _, _, _, _, _, "X", "X", "X"):
            SetRoundWinner(name: playerX ?? "")
            GoToWinScreen()
        case("X", _, _, "X", _, _, "X", _, _):
            SetRoundWinner(name: playerX ?? "")
            GoToWinScreen()
        case(_, "X", _, _, "X", _, _, "X", _):
            SetRoundWinner(name: playerX ?? "")
            GoToWinScreen()
        case(_, _, "X", _, _, "X", _, _, "X"):
            SetRoundWinner(name: playerX ?? "")
            GoToWinScreen()
        case("X", _, _, _, "X", _, _, _, "X"):
            SetRoundWinner(name: playerX ?? "")
            GoToWinScreen()
        case(_, _, "X", _, "X", _, "X", _, _):
            SetRoundWinner(name: playerX ?? "")
            GoToWinScreen()
            
            //Win conditions for player O
            //sets the name of the winner to be sent to the next viewcontroller
            //goes to the next viewcontroller
        case("O","O", "O", _, _, _, _, _, _):
            SetRoundWinner(name: playerO ?? "")
            GoToWinScreen()
        case(_, _, _, "O", "O", "O", _, _, _):
            SetRoundWinner(name: playerO ?? "")
            GoToWinScreen()
        case(_, _, _, _, _, _, "O", "O", "O"):
            SetRoundWinner(name: playerO ?? "")
            GoToWinScreen()
        case("O", _, _, "O", _, _, "O", _, _):
            SetRoundWinner(name: playerO ?? "")
            GoToWinScreen()
        case(_, "O", _, _, "O", _, _, "O", _):
            SetRoundWinner(name: playerO ?? "")
            GoToWinScreen()
        case(_, _, "O", _, _, "O", _, _, "O"):
            SetRoundWinner(name: playerO ?? "")
            GoToWinScreen()
        case("O", _, _, _, "O", _, _, _, "O"):
            SetRoundWinner(name: playerO ?? "")
            GoToWinScreen()
        case(_, _, "O", _, "O", _, "O", _, _):
            SetRoundWinner(name: playerO ?? "")
            GoToWinScreen()
            
            //Condition where no player wins
        case let (row1Square1Button, row1Square2Button, row1Square3Button, row2Square1Button, row2Square2Button, row2Square3Button, row3Square1Button, row3Square2Button,row3Square3Button) where row1Square1Button != nil && row1Square2Button != nil && row1Square3Button != nil && row2Square1Button != nil && row2Square2Button != nil && row2Square3Button != nil && row3Square1Button != nil && row3Square2Button != nil && row3Square3Button != nil:
            roundWinner = "Tie!"
            GoToWinScreen()
            
        default: print("Nothing happened")
            
            
        }
        
    }

    //displays the name of the current player turn
    func PlayerTurnDisplayTracker(name : String){
        playerTurnLabel.text = "Current Turn: \(name)"
    }
    
    
    
    func PlayerMarksSpot(sender: UIButton){
        //sets the font and disables the pressed button
        sender.titleLabel?.font = UIFont(name: "Helvetica", size: 80)
        sender.isEnabled = false
        
        //checks what player pressed
        if playerTurn == "Player O"{
            sender.setTitle("O", for: .normal)
            //changes whose turn it displays
            PlayerTurnDisplayTracker(name: playerX ?? "Player X")
            // sets whose turn it is to set a different marker
            playerTurn = "Player X"
        }else if playerTurn == "Player X"{
            sender.setTitle("X", for: .normal)
            PlayerTurnDisplayTracker(name: playerO ?? "Player O")
            playerTurn = "Player O"
        }
        
        
        
        
    }
    
    // when a button is pressed it is marked depending on the current player turn
    // the button variable is given a value
    // checks if win conditions are achieved
    @IBAction func row1Square1Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
        row1Square1Button = sender.titleLabel?.text
        WinConditionTracker()
    }
    
    @IBAction func row1Square2Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
        row1Square2Button = sender.titleLabel?.text
        WinConditionTracker()
    }
    
    @IBAction func row1Square3Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
        row1Square3Button = sender.titleLabel?.text
        WinConditionTracker()
    }
    
    @IBAction func row2Square1Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
        row2Square1Button = sender.titleLabel?.text
        WinConditionTracker()
    }
    
    @IBAction func row2Square2Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
        row2Square2Button = sender.titleLabel?.text
        WinConditionTracker()
    }
    
    @IBAction func row2Square3Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
        row2Square3Button = sender.titleLabel?.text
        WinConditionTracker()
    }
    
    @IBAction func row3Square1Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
        row3Square1Button = sender.titleLabel?.text
        WinConditionTracker()
    }
    
    @IBAction func row3Square2Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
        row3Square2Button = sender.titleLabel?.text
        WinConditionTracker()
    }
    
    @IBAction func row3Square3Pressed(_ sender: UIButton) {
        PlayerMarksSpot(sender: sender)
        
        row3Square3Button = sender.titleLabel?.text
        WinConditionTracker()
    }
    
    
    
}

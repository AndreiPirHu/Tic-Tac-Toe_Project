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
    
    var playerTurn : String = "Player X"
    var playerX : String?
    var playerO : String?
    var roundWinner : String?
    
    let segueToWinScreen = "SegueToWinScreen"

    @IBOutlet weak var playerTurnLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        PlayerTurnDisplayTracker(name: playerX ?? "Player X")
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToWinScreen{
            if let destinationVC = segue.destination as? WinScreenViewController{
                destinationVC.winnerName = roundWinner
                destinationVC.playerX = playerX
                destinationVC.playerO = playerO
            }
        }
    }
    
    
    func GoToWinScreen(){
        performSegue(withIdentifier: segueToWinScreen, sender: self)
    }
    
    func WinConditionTracker(){
        switch(row1Square1Button, row1Square2Button, row1Square3Button, row2Square1Button, row2Square2Button, row2Square3Button, row3Square1Button, row3Square2Button,row3Square3Button){
            
            //Win conditions for player X
        case("X","X", "X", _, _, _, _, _, _):
            roundWinner = "\(playerX ?? "") wins!"
            GoToWinScreen()
        case(_, _, _, "X", "X", "X", _, _, _): print("You Win!!")
            roundWinner = "\(playerX ?? "") wins!"
            GoToWinScreen()
        case(_, _, _, _, _, _, "X", "X", "X"): print("You Win!!")
            roundWinner = "\(playerX ?? "") wins!"
            GoToWinScreen()
        case("X", _, _, "X", _, _, "X", _, _): print("You Win!!")
            roundWinner = "\(playerX ?? "") wins!"
            GoToWinScreen()
        case(_, "X", _, _, "X", _, _, "X", _): print("You Win!!")
            roundWinner = "\(playerX ?? "") wins!"
            GoToWinScreen()
        case(_, _, "X", _, _, "X", _, _, "X"): print("You Win!!")
            roundWinner = "\(playerX ?? "") wins!"
            GoToWinScreen()
        case("X", _, _, _, "X", _, _, _, "X"): print("You Win!!")
            roundWinner = "\(playerX ?? "") wins!"
            GoToWinScreen()
        case(_, _, "X", _, "X", _, "X", _, _): print("You Win!!")
            roundWinner = "\(playerX ?? "") wins!"
            GoToWinScreen()
            
            //Win conditions for player O
            //sets the name of the winner to be sent to the next viewcontroller
            //goes to the next viewcontroller
        case("O","O", "O", _, _, _, _, _, _): print("You Win!!")
            roundWinner = "\(playerO ?? "") wins!"
            GoToWinScreen()
        case(_, _, _, "O", "O", "O", _, _, _): print("You Win!!")
            roundWinner = "\(playerO ?? "") wins!"
            GoToWinScreen()
        case(_, _, _, _, _, _, "O", "O", "O"): print("You Win!!")
            roundWinner = "\(playerO ?? "") wins!"
            GoToWinScreen()
        case("O", _, _, "O", _, _, "O", _, _): print("You Win!!")
            roundWinner = "\(playerO ?? "") wins!"
            GoToWinScreen()
        case(_, "O", _, _, "O", _, _, "O", _): print("You Win!!")
            roundWinner = "\(playerO ?? "") wins!"
            GoToWinScreen()
        case(_, _, "O", _, _, "O", _, _, "O"): print("You Win!!")
            roundWinner = "\(playerO ?? "") wins!"
            GoToWinScreen()
        case("O", _, _, _, "O", _, _, _, "O"): print("You Win!!")
            roundWinner = "\(playerO ?? "") wins!"
            GoToWinScreen()
        case(_, _, "O", _, "O", _, "O", _, _): print("You Win!!")
            roundWinner = "\(playerO ?? "") wins!"
            GoToWinScreen()
            
            //Condition where no player wins
        case let (row1Square1Button, row1Square2Button, row1Square3Button, row2Square1Button, row2Square2Button, row2Square3Button, row3Square1Button, row3Square2Button,row3Square3Button) where row1Square1Button != nil && row1Square2Button != nil && row1Square3Button != nil && row2Square1Button != nil && row2Square2Button != nil && row2Square3Button != nil && row3Square1Button != nil && row3Square2Button != nil && row3Square3Button != nil:
            roundWinner = "Tie!"
            GoToWinScreen()
            
        default: print("Nothing happened")
            
            
        }
        
    }

    func PlayerTurnDisplayTracker(name : String){
        playerTurnLabel.text = "Current Turn: \(name)"
    }
    
    
    
    func PlayerMarksSpot(sender: UIButton){
        sender.titleLabel?.font = UIFont(name: "Helvetica", size: 80)
        sender.isEnabled = false
        
        if playerTurn == "Player O"{
            sender.setTitle("O", for: .normal)
            PlayerTurnDisplayTracker(name: playerX ?? "Player X")
            playerTurn = "Player X"
        }else if playerTurn == "Player X"{
            sender.setTitle("X", for: .normal)
            PlayerTurnDisplayTracker(name: playerO ?? "Player O")
            playerTurn = "Player O"
        }
        
        
        
        
    }
    
    
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

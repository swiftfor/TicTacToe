//
//  ViewController.swift
//  TicTacToe
//
//  Created by Hamada on 5/27/18.
//  Copyright © 2018 Hamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// nought is 1 and cross is 2
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
         activeGame = true
         activePlayer = 1
         gamestate = [0,0,0,0,0,0,0,0,0]
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton
            {
                button.setImage(nil, for: [])
            }
            winnerLabel.isHidden = true
            playAgainButton.isHidden = true
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        }
       
        
    }
    var activeGame = true
    var activePlayer = 1
    var winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gamestate = [0,0,0,0,0,0,0,0,0]
    @IBAction func button(_ sender: AnyObject) {
        let activePosition = sender.tag - 1
        if gamestate[activePosition] == 0 && activeGame{
            gamestate[activePosition] = activePlayer
        
        if activePlayer == 1{
        sender.setImage(UIImage(named: "nought.png"), for: [])
        activePlayer = 2
        }else{
            sender.setImage(UIImage(named: "cross.png"), for: [])
            activePlayer = 1
        }
            for combination in winningCombination{
                if gamestate[combination[0]] != 0 && gamestate[combination[0]] == gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]]{
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    if gamestate[combination[0]] == 1{
                        winnerLabel.text = "Nought has Won!"
                    }else{
                        winnerLabel.text = "Crossess has Won!"
                    }
                    UIView.animate(withDuration: 1) {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    }
                    
                }
            }
    }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }


}


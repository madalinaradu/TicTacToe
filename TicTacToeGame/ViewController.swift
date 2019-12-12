//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Madalina on 01/12/2019.
//  Copyright © 2019 Alexandra Radu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     var activePlayer = 1
     var gameState = [0, 0, 0,
                      0, 0, 0,
                      0, 0, 0]
    
let winningCombinations = [
              [0,1,2], [3,4,5], [6,7,8],
              [0,3,6], [1,4,7], [2,5,8],
              [0,4,8], [2,4,6]
                            ]
    var gameIsActive = true
    
    @IBOutlet weak var gameInfoLabel: UILabel!
       
    var turnCount = 0
    @IBAction func action(_ sender: AnyObject) {
        turnCount += 1
        if (gameState[sender.tag - 1] == 0  && gameIsActive == true)
        {
            gameState[sender.tag - 1] = activePlayer
            
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                activePlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations{
            if  gameState[combination[0]] != 0 &&
                gameState[combination[0]] == gameState[combination[1]] &&
                gameState[combination[1]] == gameState[combination[2]]
            {
                    gameIsActive = false
                
                    resetGameButton.isHidden = false
                    gameInfoLabel.isHidden = false
                
                if gameState[combination[0]] == 1{
                    
                    gameInfoLabel.text = "CROSS HAS WON!"
                }
                else if gameState[combination[1]] == 2{
                    gameInfoLabel.text = "NOUGHT HAS WON!"
                }
            }
        }
            if gameIsActive && turnCount == 9
            {
               gameInfoLabel.text = "IT'S A DRAW!"
                gameIsActive = false
                gameInfoLabel.isHidden = false
                resetGameButton.isHidden = false
        }
        
    }

     @IBOutlet weak var resetGameButton: UIButton!
     @IBAction func resetGame(_ sender: AnyObject) {
        
        gameState = [0, 0, 0,
                     0, 0, 0,
                     0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        resetGameButton.isHidden = true
        gameInfoLabel.isHidden = true
        
            for i in 1...9 {
                      let button = view.viewWithTag(i) as! UIButton
                      button.setImage(nil, for: UIControl.State())
                }
        }
    


    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }



}





























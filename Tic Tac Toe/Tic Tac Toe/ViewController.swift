//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by HGPMAC82 on 6/21/19.
//  Copyright © 2019 HGPMAC82. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activePlayer = 1 //Bowser
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2,], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: Any)
    {
        if (gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true)
        {
            gameState[(sender as AnyObject).tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                (sender as AnyObject).setImage(UIImage(named: "BowserHeadSSBU.png" ), for: UIControl.State())
                activePlayer = 2
            }
            else
            {
                (sender as AnyObject).setImage(UIImage(named: "MarioHeadSSBUWebsite.png" ), for: UIControl.State())
                activePlayer = 1
            } 
        }
       
    for combination in winningCombinations
    {
        
         if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[0]] == gameState[combination[2]]
        {
            gameIsActive = false
            
            if gameState[combination[0]] == 1
            {
          
                label.text = "Bowser Dun Won!"
            }
            else
            {
                label.text = "Mario Dun Won!"
            }
            
            playAgainButton.isHidden = false
            label.isHidden = false
        }
    }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            label.text = "You both suck"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
}
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
             let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


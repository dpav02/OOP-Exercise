//
//  ViewController.swift
//  OOP-Exercise
//
//  Created by David Pavel on 11/28/15.
//  Copyright © 2015 David Pavel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player1AttackButton: UIButton!
    @IBOutlet weak var player1AttackLabel: UILabel!
    @IBOutlet weak var player1Image: UIImageView!
    
    @IBOutlet weak var player2AttackLabel: UILabel!
    @IBOutlet weak var player2AttackButton: UIButton!
    @IBOutlet weak var player2Image: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var resetGameButton: UIButton!
    @IBOutlet weak var resetGameLabel: UILabel!
    
    var player1: Character!
    var player2: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
    }

    func newGame() {
        messageLabel.text = "Fight!"
        
        player1 = Character(name: "WetPussy69", attackPower: 25, hp: 100, type: "Orc")
        player2 = Character(name: "AssLicker40", attackPower: 25, hp: 100, type: "Solider")
        
        player1AttackButton.hidden = false
        player1AttackLabel.hidden = false
        player1Image.hidden = false
        
        player2AttackButton.hidden = false
        player2AttackLabel.hidden = false
        player2Image.hidden = false
        
        resetGameButton.hidden = true
        resetGameLabel.hidden = true
    }
    
    func restartGame() {
        player1AttackButton.hidden = true
        player1AttackLabel.hidden = true
        player1Image.hidden = true
        
        player2AttackButton.hidden = true
        player2AttackLabel.hidden = true
        player2Image.hidden = true
        
        resetGameButton.hidden = false
        resetGameLabel.hidden = false
    }
    
    func showPlayer1Button() {
        player1AttackButton.hidden = false
        player1AttackLabel.hidden = false
    }
    
    func showPlayer2Button() {
        player2AttackButton.hidden = false
        player2AttackLabel.hidden = false
    }
    
    @IBAction func player1AttackPressed(sender: AnyObject) {
        player2AttackButton.hidden = true
        player2AttackLabel.hidden = true
        
        let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "showPlayer2Button", userInfo: nil, repeats: false)
        
        if player2.isAlive {
            player2.isAttacked(player1.attackPower)
            messageLabel.text = "\(player1.name) attacked \(player2.name) for \(player1.attackPower)!"
        } else {
            timer.invalidate()
            messageLabel.text = "\(player1.name) wins!"
            restartGame()
        }
        
        
    }
    
    @IBAction func player2AttackPressed(sender: AnyObject) {
        player1AttackButton.hidden = true
        player1AttackLabel.hidden = true
        
        let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "showPlayer1Button", userInfo: nil, repeats: false)
        
        if player1.isAlive {
            player1.isAttacked(player2.attackPower)
            messageLabel.text = "\(player2.name) attacked \(player1.name) for \(player2.attackPower)!"
        } else {
            timer.invalidate()
            messageLabel.text = "\(player2.name) wins!"
            restartGame()
        }
    }
    @IBAction func resetGamePressed(sender: AnyObject) {
        newGame()
    }
}


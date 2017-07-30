//
//  ViewController.swift
//  RPS
//
//  Created by Arun Seshan on 23/07/17.
//  Copyright © 2017 Arun Seshan. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockSign: UIButton!
    @IBOutlet weak var paperSign: UIButton!
    @IBOutlet weak var scissorSign: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
    }
    
    func computeResult(playerSign : Sign, computerSign : Sign) -> GameState {
        if(playerSign == .rock && computerSign == .rock) {
            return .draw
        }else if(playerSign == .paper && computerSign == .paper){
            return .draw
        }else if(playerSign == .scissors && computerSign == .scissors){
            return .draw
        }else if(playerSign == .scissors && computerSign == .paper){
            return .win
        }else if(playerSign == .scissors && computerSign == .rock){
            return .loose
        }else if(playerSign == .rock && computerSign == .scissors){
            return .win
        }else if(playerSign == .rock && computerSign == .paper){
            return .loose
        }else if(playerSign == .paper && computerSign == .scissors){
            return .loose
        }else if(playerSign == .paper && computerSign == .rock){
            return .win
        }
        return .loose
    }
    
    func play(playerPressed : Sign){
        let computerSign : Sign = randomSign()
        var passGameState : GameState = .start
        if(playerPressed == .rock){
            passGameState = computeResult(playerSign: .rock, computerSign: computerSign)
        }
        
        if(playerPressed == .paper){
            passGameState = computeResult(playerSign: .paper, computerSign: computerSign)
        }
        
        if(playerPressed == .scissors){
            passGameState = computeResult(playerSign: .scissors, computerSign: computerSign)
        }
        
        updateUI(passedGameState: passGameState)
    }
    func updateUI(passedGameState : GameState){
        switch passedGameState {
        case .draw:
            print("")
            appSign.text=""
            statusLabel.text="Draw"
            rockSign.isHidden = true
            paperSign.setTitle("✋", for: .normal)
            scissorSign.isHidden = true
            playButton.isHidden = false
        case .loose:
            print("")
            appSign.text=""
            statusLabel.text="You Lost"
            rockSign.isHidden = true
            paperSign.setTitle("👎", for: .normal)
            scissorSign.isHidden = true
            playButton.isHidden = false
        case .win:
            appSign.text=""
            statusLabel.text="You Won"
            rockSign.isHidden = true
            paperSign.setTitle("👍", for: .normal)
            scissorSign.isHidden = true
            playButton.isHidden = false
        case .start:
            appSign.text="🤖"
            statusLabel.text="Rock, Paper, Scissors?"
            rockSign.isHidden = false
            paperSign.setTitle("✋", for: .normal)
            scissorSign.isHidden = false
            playButton.isHidden = false
        }
       
        
    }
    
    @IBAction func rockPressed(_ sender: UIButton) {
        
        play(playerPressed: .rock)
    }
    
    @IBAction func paperPressed(_ sender: UIButton) {
        play(playerPressed: .paper)
    }
   
    @IBAction func scissorsPressed(_ sender: UIButton) {
        play(playerPressed: .scissors)
    }
    
    @IBAction func repeatPressed(_ sender: UIButton) {
        //updateUI()
        updateUI(passedGameState: .start)
    }
    
}


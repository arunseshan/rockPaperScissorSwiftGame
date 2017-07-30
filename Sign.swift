//
//  Sign.swift
//  RPS
//
//  Created by Arun Seshan on 23/07/17.
//  Copyright © 2017 Arun Seshan. All rights reserved.
//
import GameplayKit
import Foundation


let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign{
    let sign = randomChoice.nextInt()
    if sign == 0{
        return .rock
    }else if sign == 1{
        return .paper
    }else{
        return .scissors
    }
}


enum Sign{
    case rock, paper, scissors
}






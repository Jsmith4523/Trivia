//
//  Question.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/2/23.
//

import Foundation

struct Question {
    
    enum EntertainmentType: String {
        case movies     = "Movies"
        case history    = "History"
        case music      = "Music"
        case videoGames = "Video Games"
        case animals    = "Animals"
    }
    
    let title: String
    let entertainmentType: EntertainmentType
    let correctAnswer: String
    let answers: [String]
    
}

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
    
    
    static func triviaQuestions() -> [Self] {
        let questionOneAnswers: [String] = ["Mr. Incredible", "T'Challa", "Elsa", "Gru"]
        let questionOne: Question = .init(title: "What character shaped a popular figure in the movie Black Panther?", entertainmentType: .movies, correctAnswer: questionOneAnswers[1], answers: questionOneAnswers)
        
        let questionTwoAnswers: [String] = ["Grand Theft Auto", "Mario Kart", "FNAF", "Forza Horizon"]
        let questionTwo: Question = .init(title: "What video game title is known for committing crimes and stealing vehicles?", entertainmentType: .videoGames, correctAnswer: questionTwoAnswers[0], answers: questionTwoAnswers)
        
        let questionThreeAnswers: [String] = ["Baby - Justin Beiber", "See You Again - Wiz Khalifa", "Baby Shark Dance", "Gangnam Style - PSY"]
        let questionThree: Question = .init(title: "What song is the most popular song on YouTube, massing over 1 Billion views?", entertainmentType: .music, correctAnswer: questionThreeAnswers[2], answers: questionThreeAnswers)
        
        let questionFourAnswers: [String] = ["QWER", "ABCD", "DCNF", "ASDF"]
        let questionFour: Question = .init(title: "What 4 keyboard keys are pressed when playing computer-based games?", entertainmentType: .videoGames, correctAnswer: questionFourAnswers[3], answers: questionFourAnswers)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
}

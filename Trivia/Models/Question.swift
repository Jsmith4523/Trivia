//
//  Question.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/2/23.
//

import Foundation

struct Question: Decodable {
    let category: String
    let correctAnswer: String
    let question: String
    let difficulty: String
    let incorrectAnswers: [String]
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case correctAnswer = "correct_answer"
        case difficulty
        case question
        case incorrectAnswers = "incorrect_answers"
        case type
    }
}

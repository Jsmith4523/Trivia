//
//  Game.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/9/23.
//

import Foundation

struct GameSettings {
    
    enum Category: Int {
        case politics = 24
        case art      = 25
        case animals  = 27
        case vehicles = 28
        
        var header: String {
            "&category=\(self.rawValue)"
        }
    }
    
    enum Difficulty: String {
        case easy   = "easy"
        case medium = "medium"
        case hard   = "hard"
        
        var header: String {
            "&difficulty=\(self.rawValue)"
        }
    }
    
    let questionAmount: Int = 5
    let category: Category? = nil
    let difficulty: Difficulty? = nil
    
    ///Create url from game settings
    func url() -> URL? {
        return URL(string: "https://opentdb.com/api.php?amount=\(self.questionAmount)\(self.category?.header ?? "")\(self.difficulty?.header ?? "")")
    }
}

//
//  Game.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/9/23.
//

import Foundation
import UIKit

struct GameSettings {
    
    enum Category: Int, CaseIterable {
        case politics = 24
        case art      = 25
        case animals  = 27
        case vehicles = 28
        
        var header: String {
            "&category=\(self.rawValue)"
        }
        
        var title: String {
            switch self {
            case .politics:
                return "Politics"
            case .art:
                return "Art"
            case .animals:
                return "Animals"
            case .vehicles:
                return "Vehicles"
            }
        }
    }
    
    enum Difficulty: String, CaseIterable {
        case easy   = "easy"
        case medium = "medium"
        case hard   = "hard"
        
        var header: String {
            "&difficulty=\(self.rawValue)"
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .easy:
                return .systemGreen
            case .medium:
                return .systemOrange
            case .hard:
                return .systemRed
            }
        }
        
        var title: String {
            switch self {
            case .easy:
                return "Easy"
            case .medium:
                return "Medium"
            case .hard:
                return "Hard"
            }
        }
        
        static func matchWithTitle(_ title: String) -> Self? {
            self.allCases.first(where: {$0.title == title})
        }
    }
    
    let questionAmount: Int = 5
    var category: Category? = nil
    var difficulty: Difficulty? = nil
    
    ///Create url from game settings
    func url() -> URL? {
        return URL(string: "https://opentdb.com/api.php?amount=\(self.questionAmount)\(self.category?.header ?? "")\(self.difficulty?.header ?? "")&type=multiple")
    }
}

//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/9/23.
//

import Foundation


final class TriviaQuestionService {
    
    enum TriviaQuestionServiceError: Error {
        case invalidUrl
        case error
    }
    
    //Shared Instance
    static let shared = TriviaQuestionService()

    private var gameSettings: GameSettings!
        
    func getTriviaQuestion(gameSettings: GameSettings, completion: @escaping (Result<[Question], TriviaQuestionServiceError>) -> Void) {
        
        guard let url = gameSettings.url() else {
            completion(.failure(.invalidUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data, err == nil else {
                completion(.failure(.error))
            }
            
            
            
        }.resume()
    }
    
    func endGame() {
        self.gameSettings = nil
    }
}

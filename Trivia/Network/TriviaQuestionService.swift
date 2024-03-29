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
        case decodingError
        case error
    }
    
    //Shared Instance
    static let shared = TriviaQuestionService()

    private var gameSettings: GameSettings!
        
    ///Get trivia questions with new game settings
    func getTriviaQuestion(gameSettings: GameSettings,
                           completion: @escaping (Result<[Question], TriviaQuestionServiceError>) -> Void) {
        guard let url = gameSettings.url() else {
            completion(.failure(.invalidUrl))
            return
        }
        
        self.gameSettings = gameSettings
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data, err == nil else {
                completion(.failure(.error))
                return
            }
            
            do {
                //Noticed from the JSON that we have to directly access the "results" dictionary.
                //Threw a bit of annoyance, but hoping that this solution helps!
                if let jsonData = try JSONSerialization.jsonObject(with: data) as? [String: Any], let results = jsonData["results"] {
                    let resultsData = try JSONSerialization.data(withJSONObject: results)
                    let questions = try JSONDecoder().decode([Question].self, from: resultsData)
                    completion(.success(questions))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    ///Get new trivia questions based upon current game settings
    func getNewTriviaQuestions(completion: @escaping (Result<[Question], TriviaQuestionServiceError>) -> Void) {
        getTriviaQuestion(gameSettings: self.gameSettings!) { result in
            completion(result)
        }
    }
    
    func endGame() {
        self.gameSettings = nil
    }
}

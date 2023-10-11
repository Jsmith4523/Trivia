//
//  ResultsViewController.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/4/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var questionsCount: Int?
    var correctAnswers: Int?
    
    var startGameOver: (([Question]) -> ())?
    
    //MARK: Actions
    @IBAction func restartGame(_ sender: Any) {
        getNewTriviaQuestions()
    }

    //MARK: Outlets
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func getNewTriviaQuestions() {
        TriviaQuestionService.shared.getNewTriviaQuestions { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let questions):
                    self?.startGameOver!(questions)
                    self?.dismiss(animated: true)
                case .failure(_):
                    break
                }
            }
        }
    }
    
    private func configureView() {
        self.correctAnswerLabel.text = "You got \(correctAnswers!) out of \(questionsCount!) answers correct!"
    }
}

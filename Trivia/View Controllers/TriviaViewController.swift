//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/2/23.
//

import UIKit

class TriviaViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var entertainmentLabel: UILabel!
    @IBOutlet weak var questionTitleLabel: UILabel!
    
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    
    //MARK: Actions
    @IBAction func answerOneSelected(_ sender: UIButton) {
        self.determineGuess(sender.titleLabel!.text!)
    }
    @IBAction func answerTwoSelected(_ sender: UIButton) {
        self.determineGuess(sender.titleLabel!.text!)
    }
    @IBAction func answerThreeSelected(_ sender: UIButton) {
        self.determineGuess(sender.titleLabel!.text!)
    }
    @IBAction func answerFourSelected(_ sender: UIButton) {
        self.determineGuess(sender.titleLabel!.text!)
    }
    
    //MARK: - Properties
    
    private var question: Question!
    private var questionCount = 0
    private var correctAnswerCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func determineGuess(_ guessedAnswer: String) {
        guard question.correctAnswer == guessedAnswer else {
            self.userDidAnswerIncorrectly(question.correctAnswer)
            return
        }
    }
    
    private func userDidAnswerIncorrectly(_ correctAnswer: String) {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
        let ac = UIAlertController(title: "Wrong!",
                                   message: "The correct answer is \"\(correctAnswer)\"",
                                   preferredStyle: .alert)
        
        let primaryAction = UIAlertAction(title: "OK", style: .default, handler: continueGame(_:))
        ac.addAction(primaryAction)
        show(ac, sender: nil)
    }
    
    private func continueGame(_ action: UIAlertAction? = nil) {
        
    }
    
    private func endGame() {
        let ac = UIAlertController(title: "The End!",
                                   message: "",
                                   preferredStyle: .alert)
        
        show(ac, sender: nil)
    }
}

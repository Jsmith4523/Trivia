//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/2/23.
//

import UIKit

//Work has not been completed all the way as I have been busy!!!

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
    
    private var questions: [Question]!
    private var question: Question!
    private var questionCount = 0
    private var correctAnswerCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }

    private func determineGuess(_ guessedAnswer: String) {
        guard let question, question.correctAnswer == guessedAnswer else {
            self.userDidAnswerIncorrectly(question.correctAnswer)
            return
        }
        
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        self.correctAnswerCount += 1
        self.continueGame()
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
        if let questions {
            guard !(questions.count == questionCount) else {
                endGame()
                return
            }
            self.question = questions[questionCount]
            self.questionCount += 1
            configureGame()
        }
    }
    
    private func endGame() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController {
            vc.correctAnswers = correctAnswerCount
            vc.isModalInPresentation = true
            vc.questionsCount = questions!.count
            vc.startGameOver = startGameOver
            vc.sheetPresentationController?.preferredCornerRadius  = 25
            
            present(vc, animated: true)
        }
    }
    
    private func startGameOver() {
        self.correctAnswerCount = 0
        self.questionCount = 0
        startGame()
    }
    
    private func startGame() {
        self.questions = Question.triviaQuestions().shuffled()
        continueGame()
    }
    
    private func configureGame() {
        if let question {
            let answers = question.answers.shuffled()
            
            self.questionCountLabel.text = "Question \(questionCount) of \(questions!.count)"
            self.questionTitleLabel.text = question.title
            self.entertainmentLabel.text = "Entertainment: \(question.entertainmentType.rawValue)"
            self.answerOneButton.setTitle(answers[0], for: .normal)
            self.answerTwoButton.setTitle(answers[1], for: .normal)
            self.answerThreeButton.setTitle(answers[2], for: .normal)
            self.answerFourButton.setTitle(answers[3], for: .normal)
        }
    }
}

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
    
    var startGameOver: (() -> ())?
    
    //MARK: Actions
    @IBAction func startGameOver(_ sender: Any) {
        //After the model is dismissed, we can call the closure to start the game over...
        self.dismiss(animated: true) {
            self.startGameOver!()
        }
    }
    
    //MARK: Outlets
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        self.correctAnswerLabel.text = "You got \(correctAnswers!) out of \(questionsCount!) answers correct!"
    }
}

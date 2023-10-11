//
//  TriviaCustomizationViewController.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/9/23.
//

import Foundation
import UIKit

class TriviaCustomizationViewController: UIViewController {
    
    //MARK: - Actions
    @IBAction func difficultyPickerDidChange(_ sender: UISegmentedControl) {
    }
    
    //MARK: - Outlets
    @IBOutlet weak var difficultyPicker: UISegmentedControl!
    
    private var gameSettings = GameSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationController()
    }
    
    private func setupNavigationController() {
        let startButton = UIBarButtonItem(title: "Start", style: .done, target: self, action: #selector(startGame))
        
        startButton.tintColor = .red
        self.navigationController?.navigationItem.rightBarButtonItem = startButton
    }
    
    private func didSelectDifficulty(_ difficulty: GameSettings.Difficulty) {
        self.gameSettings.difficulty = difficulty
    }
    
    private func didSelectCategory(_ category: GameSettings.Category) {
        self.gameSettings.category = category
    }
        
    @objc
    private func startGame() {
        TriviaQuestionService.shared.getTriviaQuestion(gameSettings: gameSettings) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let questions):
                    pushToTriviaViewController(questions)
                case .failure(_):
                    didFailToStartGame()
                }
            }
        }
       
        func pushToTriviaViewController(_ questions: [Question]) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let triviaVC = storyboard.instantiateViewController(withIdentifier: "TriviaViewController") as? TriviaViewController {
                triviaVC.startGame(questions: questions, gameSettings: gameSettings)
                self.navigationController?.pushViewController(triviaVC, animated: true)
            }
        }
        
        func didFailToStartGame() {
            let ac = UIAlertController(title: "Oh no!",
                                       message: "There was an issue getting everything together. Please try again",
                                       preferredStyle: .alert)
            let primaryAction = UIAlertAction(title: "OK", style: .default)
            ac.addAction(primaryAction)
            present(ac, animated: true)
        }
    }
}

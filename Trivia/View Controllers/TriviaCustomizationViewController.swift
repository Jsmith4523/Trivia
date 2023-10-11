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
    @IBAction func startGame(_ sender: Any) {
        self.startGame()
    }
    
    @IBAction func difficultyPickerDidChange(_ sender: UISegmentedControl) {
        gameSettings.difficulty = GameSettings.Difficulty.matchWithTitle(sender.titleForSegment(at: sender.selectedSegmentIndex)!)
    }
    
    //MARK: - Outlets
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var difficultyPicker: UISegmentedControl!
    
    private var gameSettings = GameSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
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
    
    private func configureView() {
        self.categoryTableView.delegate = self
        self.categoryTableView.dataSource = self
        
        difficultyPicker.removeAllSegments()
        for i in 0..<GameSettings.Difficulty.allCases.count {
            difficultyPicker.insertSegment(withTitle: GameSettings.Difficulty.allCases[i].title, at: i, animated: true)
        }
    }
}

//MARK: UITableViewDelegate and UITableViewDataSource
extension TriviaCustomizationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gameSettings.category = GameSettings.Category.allCases[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCell = UITableViewCell(style: .default, reuseIdentifier: "Category")
        tableViewCell.textLabel?.text = GameSettings.Category.allCases[indexPath.row].title
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameSettings.Category.allCases.count
    }
}

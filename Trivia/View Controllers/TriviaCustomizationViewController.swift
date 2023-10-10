//
//  TriviaCustomizationViewController.swift
//  Trivia
//
//  Created by Jaylen Smith on 10/9/23.
//

import Foundation
import UIKit

class TriviaCustomizationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupNavigationController() {
        let startButton = UIBarButtonItem(title: "Start", style: .done, target: self, action: #selector(startGame))
        
        self.navigationItem.rightBarButtonItem = startButton
    }
    
    private func presentDifficultyView() {
        
    }
    
    private func presentCategoryView() {
        
    }
    
    @objc
    private func startGame() {
        
        TriviaQuestionService.shared.getTriviaQuestion(userSettings: <#T##[String : Any]#>) { [weak self] in
            
        }
       
        
        func pushToTriviaViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let triviaVC = storyboard.instantiateViewController(withIdentifier: "TriviaViewController") as? TriviaViewController {
                
            }
        }
    }
}


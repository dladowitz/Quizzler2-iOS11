//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var currentQuestionNumber: Int = 0
    var score: Int = 0

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        let givenAnswer = sender.tag == 1 ? true : false

        checkAnswer(givenAnswer: givenAnswer)
        currentQuestionNumber += 1
        updateUI()
        nextQuestion()
    }
    

    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(currentQuestionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(currentQuestionNumber + 1)
    }

    func nextQuestion() {
        if (currentQuestionNumber <= 12 - 1) {
            questionLabel.text = allQuestions.list[currentQuestionNumber].questionText
        } else {
            let alert = UIAlertController(title: "End of Quiz", message: "Thanks for guessing", preferredStyle: .alert)
            let restartAlert = UIAlertAction(title: "Restart?", style: .default) { (UIAlertAction) in
                self.startOver()
            }

            alert.addAction(restartAlert)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer(givenAnswer: Bool) {
        print("Given   Answer: \(givenAnswer)")
        print("Correct Answer: \(allQuestions.list[currentQuestionNumber].answer)")

        if (givenAnswer == allQuestions.list[currentQuestionNumber].answer) {
            score += 1
            ProgressHUD.showSuccess("Correct, nice work.")
        } else {
            ProgressHUD.showError("Nope")
        }
    }
    
    
    func startOver() {
        currentQuestionNumber = 0
        score = 0
        updateUI()
        nextQuestion()
    }
}

//
//  Question.swift
//  Quizzler
//
//  Created by david ladowitz on 4/10/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {

    var questionText: String
    var answer: Bool

    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}

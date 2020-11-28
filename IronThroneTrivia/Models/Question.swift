//
//  Question.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 11/13/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import Foundation

class Question {
    let category: String
    let question: String
    let answer: Int
    let optionZero: String
    let optionOne: String
    let optionTwo: String
    let optionThree: String
    
    init(category: String, question: String, answer: Int, optionZero: String, optionOne: String, optionTwo: String, optionThree: String) {
        self.category = category
        self.question = question
        self.answer = answer
        self.optionZero = optionZero
        self.optionOne = optionOne
        self.optionTwo = optionTwo
        self.optionThree = optionThree
    }
}

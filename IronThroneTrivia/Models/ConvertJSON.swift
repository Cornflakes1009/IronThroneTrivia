//
//  ConvertJSON.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 9/9/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import Foundation

public func convertJSON(jsonToRead: String, numberOfQuestions: Int = 0) {
    var questionArr = [Question]()
    
    guard let path = Bundle.main.path(forResource: jsonToRead, ofType: "json") else { return }
    let url = URL(fileURLWithPath: path)
    
    do {
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        
        guard let jsonArray = json as? [Any] else { return }
        
        for questionAnswer in jsonArray {
            guard let questionAndAnswer = questionAnswer as? [String: Any] else { return }
            
            // assigning the values in the JSON to local variables
            guard let category      = questionAndAnswer["category"] as? String else { return }
            guard let question      = questionAndAnswer["question"] as? String else { return }
            guard let answerIndex   = questionAndAnswer["answer"] as? Int else { return }
            guard let optionZero    = questionAndAnswer["0"] as? String else { return }
            guard let optionOne     = questionAndAnswer["1"] as? String else { return }
            guard let optionTwo     = questionAndAnswer["2"] as? String else { return }
            guard let optionThree   = questionAndAnswer["3"] as? String else { return }
            
            // randomizing the answers
            var answers = [optionZero, optionOne, optionTwo, optionThree]
            let answer = answers[answerIndex]
            answers.shuffle()
            
            // creating a new instance of the Question object
            let qa = Question(category: category, question: question, answer: answer, optionZero: answers[0], optionOne: answers[1], optionTwo: answers[2], optionThree: answers[3])
            
            // appending the recently converted JSON object to an array of Question objects to pull questions from
            questionArr.append(qa)
            
        } // end of the for in loop
        
        questionArr.shuffle()
        // handling both specified and unspecified numbers of questions to convert - Classic vs Blitz/Survival 
        if numberOfQuestions != 0 {
            for index in 1...numberOfQuestions {
                questionList.append(questionArr[index])
            }
        } else {
            questionList = questionArr
        }
        
    } catch {
        print(error)
    }
}

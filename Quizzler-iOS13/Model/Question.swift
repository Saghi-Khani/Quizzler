//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Saghi Khani on 2023-10-29.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q:String , a:[String], correctAnswer:String){
        text = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}

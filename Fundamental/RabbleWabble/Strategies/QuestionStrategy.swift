//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/3.
//  Copyright © 2019 Weslie. All rights reserved.
//

public protocol QuestionStrategy: class {
    var title: String { get }
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    func advanceToNextQuestion() -> Bool
    
    func currentQuestion() -> Question
    
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    
    func questionIndexTitle() -> String
}

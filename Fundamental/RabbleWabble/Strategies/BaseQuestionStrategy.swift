//
//  BaseQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/11.
//  Copyright © 2019 Weslie. All rights reserved.
//

public class BaseQuestionStrategy: QuestionStrategy {
    // MARK:- Properties
    public var correctCount: Int {
        get { return questionGroup.score.correctCount}
        set { questionGroup.score.correctCount = newValue }
    }
    public var incorrectCount: Int {
        get { return questionGroup.score.incorrectCount}
        set { questionGroup.score.incorrectCount = newValue }
    }
    
    private var questionGroupCaretaker: QuestionGroupCaretaker
    
    private var questionGroup: QuestionGroup {
        return questionGroupCaretaker.selectionQuestionGroup
    }
    private var questionIndex = 0
    private let questions: [Question]
    
    // MARK:- Object Lifecycle
    public init(questionCaretaker: QuestionGroupCaretaker, questions: [Question]) {
        self.questionGroupCaretaker = questionCaretaker
        self.questions = questions
//        self.questionGroupCaretaker.selectionQuestionGroup.score = QuestionGroup.Score()
        self.questionGroupCaretaker.selectionQuestionGroup.score.reset()
    }
    
    // MARK:- QuestionStrategy
    public var title: String {
        return questionGroup.title
    }
    
    public func advanceToNextQuestion() -> Bool {
        try? questionGroupCaretaker.save()
        guard questionIndex + 1 < questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questions.count)"
    }
}

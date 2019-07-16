//
//  QuestionGroupBuilder.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/14.
//  Copyright © 2019 Weslie. All rights reserved.
//

public class QuestionGroupBuilder {
    public var questions = [QuestionBuilder()]
    public var title = ""
    
    public enum Error: String, Swift.Error {
        case missingTitle
        case missingQuestions
    }
    
    public func addNewQuestion() {
        let question = QuestionBuilder()
        questions.append(question)
    }
    
    public func removeQuestion(at index: Int) {
        questions.remove(at: index)
    }
    
    public func build() throws -> QuestionGroup {
        guard self.title.count > 0 else { throw Error.missingTitle }
        guard self.questions.count > 0 else { throw Error.missingQuestions }
        
        let questions = try self.questions.map { try $0.build() }
        return QuestionGroup(questions: questions, title: title)
    }
}

public class QuestionBuilder {
    public var answer = ""
    public var hint = ""
    public var prompt = ""
    
    public enum Error: String, Swift.Error {
        case missingAnswer
        case missingPrompt
    }
    
    public func build() throws -> Question {
        guard answer.count > 0 else { throw Error.missingAnswer }
        guard prompt.count > 0 else { throw Error.missingPrompt }
        
        return Question(answer: answer, hint: hint, prompt: prompt)
    }
}

//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/3.
//  Copyright © 2019 Weslie. All rights reserved.
//

import GameplayKit.GKRandomSource

public class SequentialQuestionStrategy: BaseQuestionStrategy {
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectionQuestionGroup!
        let questions = questionGroup.questions
        
        self.init(questionCaretaker: questionGroupCaretaker, questions: questions)
    }
}

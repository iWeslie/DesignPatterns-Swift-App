//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/3.
//  Copyright © 2019 Weslie. All rights reserved.
//

import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: BaseQuestionStrategy {
    public convenience init(questionGroupCaretaker: QuestionGroupCaretaker) {
        let questionGroup = questionGroupCaretaker.selectionQuestionGroup!
        let randomSource = GKRandomSource.sharedRandom()
        let questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
        
        self.init(questionCaretaker: questionGroupCaretaker, questions: questions)
    }
}

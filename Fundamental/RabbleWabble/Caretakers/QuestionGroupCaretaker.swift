//
//  QuestionGroupCaretaker.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/11.
//  Copyright © 2019 Weslie. All rights reserved.
//

import Foundation

public final class QuestionGroupCaretaker {
    // MARK:- Properties
    private let fileName = "QuestionGroupData"
    public var questionGroups: [QuestionGroup] = []
    public var selectionQuestionGroup: QuestionGroup!
    
    // MARK:- Object Lifecycle
    public init() {
        loadQuestionGrooups()
    }
    
    private func loadQuestionGrooups() {
        if let questionGroups = try? DiskCaretaker.retrieve([QuestionGroup].self, from: fileName) {
            self.questionGroups = questionGroups
        } else {
            let bundle = Bundle.main
            let url = bundle.url(forResource: fileName, withExtension: "json")!
            self.questionGroups = try! DiskCaretaker.retrieve([QuestionGroup].self, from: url)
            try! save()
        }
    }
    
    // MARK:- Instance Methods
    public func save() throws {
        try DiskCaretaker.save(questionGroups, fileName: fileName)
    }
}

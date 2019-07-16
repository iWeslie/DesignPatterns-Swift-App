//
//  Question.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/1.
//  Copyright © 2019 Weslie. All rights reserved.
//

public class Question: Codable {
    public let answer: String
    public let hint: String?
    public let prompt: String
    
    public init(answer: String, hint: String?, prompt: String) {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}

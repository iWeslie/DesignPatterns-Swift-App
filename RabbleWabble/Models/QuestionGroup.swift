//
//  QuestionGroup.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/1.
//  Copyright © 2019 Weslie. All rights reserved.
//

public class QuestionGroup: Codable {
    public let questions: [Question]
    public var score: Score
    public let title: String
    
    public var correctCount: Int = 0 {
        didSet {
            
        }
    }
    
    public init(questions: [Question], score: Score = Score(), title: String) {
        self.questions = questions
        self.score = score
        self.title = title
    }
    
    public class Score: Codable {
        public init () { }
        public var correctCount: Int = 0 {
            didSet {
                updateRunningPercentage()
            }
        }
        public var incorrectCount: Int = 0 {
            didSet {
                updateRunningPercentage()
            }
        }
        public lazy var runningPercentage = Observable(calculateRunningPercentage())
        
        private func updateRunningPercentage() {
            runningPercentage.value = calculateRunningPercentage()
        }
        
        private func calculateRunningPercentage() -> Double {
            let totalCount = correctCount + incorrectCount
            guard totalCount > 0 else {
                return 0
            }
            
            return Double(correctCount) / Double(totalCount)
        }
        
        public func reset() {
            correctCount = 0
            incorrectCount = 0
        }
        
    }

}

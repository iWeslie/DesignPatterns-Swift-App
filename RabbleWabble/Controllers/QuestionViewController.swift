//
//  ViewController.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/1.
//  Copyright © 2019 Weslie. All rights reserved.
//

import UIKit

public protocol QuestionViewControllerDelegate: class {
    func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionGroup, at questionIndex: Int)
    
    func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionGroup)
}

public class QuestionViewController: UIViewController {
    
    // MARK:- Instance Properties
    public weak var delegate: QuestionViewControllerDelegate?
    
    public var questionGroup: QuestionGroup! {
        didSet {
            navigationItem.title = questionGroup.title
        }
    }
    
    public var questionIndex = 0
    
    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()
    
    public var correctCount = 0
    public var incorrectCount = 0
    
    public var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionView)
    }
    
    // MARK:- View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCancelButton()
        showQuestion()
    }
    
    private func setupCancelButton() {
        let action = #selector(handleCancelPresses(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, landscapeImagePhone: nil, style: .plain, target: self, action: action)
    }
    
    @objc private func handleCancelPresses(sender: UIBarButtonItem) {
        delegate?.questionViewController(self, didCancel: questionGroup, at: questionIndex)
    }

    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
        
        questionIndexItem.title = "\(questionIndex + 1)/" + "\(questionGroup.questions.count)"
    }
    
    // MARK:- Actions
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
        questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
    }
    
    @IBAction func handleIncorrect(_ sender: Any) {
        incorrectCount += 1
        questionView.incorrectCountLabel.text = "\(incorrectCount)"
        showNextQuestion()
    }
    
    @IBAction func handleCorrect(_ sender: Any) {
        correctCount += 1
        questionView.correctCountLabel.text = "\(correctCount)"
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        questionIndex += 1
        guard questionIndex < questionGroup.questions.count else {
            // TODO: - Handle this ...
            return
        }
        showQuestion()
    }
}

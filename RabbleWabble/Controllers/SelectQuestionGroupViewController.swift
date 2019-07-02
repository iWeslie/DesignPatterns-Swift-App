//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/2.
//  Copyright © 2019 Weslie. All rights reserved.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    // MARK:- Properties
    public let questionGroups = QuestionGroup.allGroups()
    private var selectdQuestionGroup: QuestionGroup!

}

// MARK:- UITableViewDataSource
extension SelectQuestionGroupViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupTableViewCell") as! QuestionGroupTableViewCell
        let QuestionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = QuestionGroup.title
        return cell
    }
}

// MARK:- UITableViewDelegate
extension SelectQuestionGroupViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectdQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? QuestionViewController else { return }
        viewController.questionGroup = selectdQuestionGroup
        viewController.delegate = self
    }
}

// MARK:- QuestionViewControllerDelegate
extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
    public func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionGroup, at questionIndex: Int) {
        navigationController?.popToViewController(self, animated: true)
    }
    
    public func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionGroup) {
        navigationController?.popToViewController(self, animated: true)
    }
}

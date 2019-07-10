//
//  AppSettingsTableViewController.swift
//  RabbleWabble
//
//  Created by Weslie Chen on 2019/7/10.
//  Copyright © 2019 Weslie. All rights reserved.
//

import UIKit

public class AppSettingsTableViewController: UITableViewController {
    
    // MARK:- Properties
    public let appSetings = AppSettings.shared
    private let cellIdentifier = "basicCell"

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

}

// MARK:- UITableViewDataSource
extension AppSettingsTableViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionStrategyType.allCases.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        cell.textLabel?.text = questionStrategyType.title()
        
        if appSetings.questionStrategyType == questionStrategyType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

// MARK:- UITableViewDelegate
extension AppSettingsTableViewController {
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        appSetings.questionStrategyType = questionStrategyType
        tableView.reloadData()
    }
}

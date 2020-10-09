//
//  ScheduleViewController.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import UIKit

struct Message {
    let quote: String
    let author: String
    let deadline: Date
}

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var messages: [Message] = []
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMessages()
    }
    
    // MARK: - Helper
    
    private func loadMessages() {
        
    }
    
    // MARK: - UITableViewDelegate
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Is data available
        guard indexPath.row < messages.count else {
            return UITableViewCell()
        }
        
        // Get cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.identifier, for: indexPath) as? MessageTableViewCell else {
            return UITableViewCell()
        }

        // data
        let message = messages[indexPath.row]
        cell.populate(with: message)
        return cell
    }
    
}

//
//  MessageTableViewCell.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var quoteLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    class var identifier: String {
        return String(describing: self)
    }
    
    func populate(with message: Message) {
        quoteLabel.text = message.quote
        authorLabel.text = message.author
        timeLabel.text = Formatter.usaDisplayTimeFrom(date: message.deadline)
    }
    
}

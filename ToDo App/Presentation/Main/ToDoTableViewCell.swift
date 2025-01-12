//
//  ToDoTableViewCell.swift
//  ToDo App
//
//  Created by Yoga Darma on 12/01/25.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var backgroundStatusLabel: UIView!
    @IBOutlet weak var statusToDoLabel: UILabel!
    @IBOutlet weak var titleToDoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        cardView.layer.cornerRadius = 16
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.layer.shadowRadius = 4
        cardView.layer.masksToBounds = false

        backgroundStatusLabel.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

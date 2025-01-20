//
//  DetailViewController.swift
//  ToDo App
//
//  Created by Yoga Darma on 21/01/25.
//

import UIKit

class DetailViewController: UIViewController {

    var data: ToDoModel?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundStatusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let todo = data {
            backgroundStatusView.layer.cornerRadius = 10
            titleLabel.text = todo.todo
            if todo.completed {
                backgroundStatusView.backgroundColor = .systemGreen
                    .withAlphaComponent(0.3)
                statusLabel.text = "Done"
                statusLabel.textColor = .systemGreen
            } else {
                backgroundStatusView.backgroundColor = .systemRed
                    .withAlphaComponent(0.3)
                statusLabel.text = "To-do"
                statusLabel.textColor = .systemRed
            }
        }
    }

    @IBAction func moveToPreviousPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

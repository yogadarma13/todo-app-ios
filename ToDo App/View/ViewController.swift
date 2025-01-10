//
//  ViewController.swift
//  ToDo App
//
//  Created by Yoga Darma on 02/01/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var newToDoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Round the button
        newToDoButton.layer.cornerRadius = 28

        // Shadow setup
        newToDoButton.layer.shadowColor = UIColor.black.cgColor
        newToDoButton.layer.shadowOpacity = 0.3
        newToDoButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        newToDoButton.layer.shadowRadius = 4
    }

    @IBAction func addNewToDo(_ sender: Any) {
        performSegue(withIdentifier: "moveCreateToDo", sender: nil)
    }
}

//
//  ViewController.swift
//  ToDo App
//
//  Created by Yoga Darma on 02/01/25.
//

import NVActivityIndicatorView
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var newToDoButton: UIButton!
    var activityIndicator: NVActivityIndicatorView!

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

        // Define the frame for the activity indicator
        let frame = CGRect(
            x: (view.frame.width - 50) / 2, y: (view.frame.height - 50) / 2,
            width: 50, height: 50)

        // Initialize the activity indicator
        activityIndicator = NVActivityIndicatorView(
            frame: frame, type: .ballSpinFadeLoader, color: .blue, padding: 10)

        // Add it to the view
        view.addSubview(activityIndicator)
        
        startLoading()
    }

    // Start the activity indicator
    func startLoading() {
        activityIndicator.startAnimating()
    }

    // Stop the activity indicator
    func stopLoading() {
        activityIndicator.stopAnimating()
    }

    @IBAction func addNewToDo(_ sender: Any) {
        performSegue(withIdentifier: "moveCreateToDo", sender: nil)
    }
}

//
//  AddToDoViewController.swift
//  ToDo App
//
//  Created by Yoga Darma on 02/01/25.
//

import UIKit

class CreateToDoViewController: UIViewController {

    @IBOutlet weak var taskField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    var viewModel: CreateToDoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func moveToPreviousPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func addNewTask(_ sender: Any) {
        if taskField.text?.isEmpty == true {
            self.showToast(message: "Field tidak boleh kosong")
        } else {
            viewModel?.createToDo(text: self.taskField.text ?? "") { _ in
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            } err: { message in
                DispatchQueue.main.async {
                    self.showToast(message: message)
                }
            }
        }
    }
}

extension UIViewController {
    func showToast(message: String) {
        let toastLabel = UILabel(
            frame: CGRect(
                x: self.view.frame.size.width / 2 - 85,
                y: self.view.frame.size.height - 150, width: 180, height: 40))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.numberOfLines = 1
        toastLabel.textColor = UIColor.white
        toastLabel.font = .systemFont(ofSize: 15.0)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        view.addSubview(toastLabel)
        UIView.animate(
            withDuration: 4.0, delay: 0.1, options: .curveEaseOut,
            animations: {
                toastLabel.alpha = 0.0
            },
            completion: { (isCompleted) in
                toastLabel.removeFromSuperview()
            })
    }
}

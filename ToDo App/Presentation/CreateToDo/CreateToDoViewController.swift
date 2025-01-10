//
//  AddToDoViewController.swift
//  ToDo App
//
//  Created by Yoga Darma on 02/01/25.
//

import UIKit
import NVActivityIndicatorView

class CreateToDoViewController: UIViewController {

    @IBOutlet weak var taskField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    var loadingIndicator: NVActivityIndicatorView!
    
    var viewModel: CreateToDoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
        loadingIndicator = setupLoadingIndicator()
        view.addSubview(loadingIndicator)
    }

    @IBAction func moveToPreviousPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func addNewTask(_ sender: Any) {
        if taskField.text?.isEmpty == true {
            self.showToast(message: "Field tidak boleh kosong")
        } else {
            showLoading(activityIndicator: loadingIndicator)
            viewModel?.createToDo(text: self.taskField.text ?? "") { _ in
                DispatchQueue.main.async {
                    self.hideLoading(activityIndicator: self.loadingIndicator)
                    self.navigationController?.popViewController(animated: true)
                }
            } err: { message in
                DispatchQueue.main.async {
                    self.hideLoading(activityIndicator: self.loadingIndicator)
                    self.showToast(message: message)
                }
            }
        }
    }
}

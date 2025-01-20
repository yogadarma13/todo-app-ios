//
//  AddToDoViewController.swift
//  ToDo App
//
//  Created by Yoga Darma on 02/01/25.
//

import Combine
import NVActivityIndicatorView
import UIKit

class CreateToDoViewController: UIViewController {

    @IBOutlet weak var taskField: UITextField!

    private var cancellables = Set<AnyCancellable>()

    var loadingIndicator: NVActivityIndicatorView!

    var viewModel: CreateToDoViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadingIndicator = setupLoadingIndicator()
        view.addSubview(loadingIndicator)

        setupObservable()
    }

    private func setupObservable() {
        viewModel?.$loading.compactMap { $0 }.sink { [weak self] loading in
            if loading {
                self!.showLoading(activityIndicator: self!.loadingIndicator)
            } else {
                self!.hideLoading(activityIndicator: self!.loadingIndicator)
            }
        }.store(in: &cancellables)

        viewModel?.$data.compactMap { $0 }.sink { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }.store(in: &cancellables)

        viewModel?.$error.compactMap { $0 }.sink { [weak self] message in
            self?.showToast(message: message)
        }.store(in: &cancellables)
    }

    @IBAction func moveToPreviousPage(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func addNewTask(_ sender: Any) {
        if taskField.text?.isEmpty == true {
            self.showToast(message: "Field tidak boleh kosong")
        } else {
            viewModel?.createToDo(text: self.taskField.text ?? "")
        }
    }
}

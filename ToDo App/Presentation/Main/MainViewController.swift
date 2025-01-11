//
//  MainViewController.swift
//  ToDo App
//
//  Created by Yoga Darma on 02/01/25.
//

import Combine
import NVActivityIndicatorView
import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var newToDoButton: UIButton!

    private var cancellables = Set<AnyCancellable>()

    var loadingIndicator: NVActivityIndicatorView!
    var viewModel: MainViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFloatingActionButton()

        loadingIndicator = setupLoadingIndicator()
        view.addSubview(loadingIndicator)

        setupObservable()
        viewModel?.getAllToDo()
    }

    private func setupFloatingActionButton() {
        newToDoButton.layer.cornerRadius = 28
        newToDoButton.layer.shadowColor = UIColor.black.cgColor
        newToDoButton.layer.shadowOpacity = 0.3
        newToDoButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        newToDoButton.layer.shadowRadius = 4
    }

    private func setupObservable() {
        viewModel?.$loading.compactMap { $0 }.sink { [weak self] loading in
            if loading {
                self!.showLoading(activityIndicator: self!.loadingIndicator)
            } else {
                self!.hideLoading(activityIndicator: self!.loadingIndicator)
            }
        }.store(in: &cancellables)

        viewModel?.$data.compactMap { $0 }.sink { [weak self] data in
            // Set to table view
        }.store(in: &cancellables)

        viewModel?.$error.compactMap { $0 }.sink { [weak self] message in
            self?.showToast(message: message)
        }.store(in: &cancellables)
    }

    @IBAction func addNewToDo(_ sender: Any) {
        performSegue(withIdentifier: "moveCreateToDo", sender: nil)
    }
}

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
    @IBOutlet weak var todoTableView: UITableView!

    private var cancellables = Set<AnyCancellable>()

    var loadingIndicator: NVActivityIndicatorView!
    var viewModel: MainViewModel?

    var todoList: [ToDoModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)

        loadingIndicator = setupLoadingIndicator()
        view.addSubview(loadingIndicator)

        setupFloatingActionButton()
        setupTableView()
        setupObservable()

        viewModel?.getAllToDo()
    }

    private func setupTableView() {
        todoTableView.dataSource = self
        todoTableView.delegate = self
        todoTableView.separatorStyle = .none
        todoTableView.contentInset = UIEdgeInsets(
            top: 0, left: 0, bottom: 80, right: 0)
        todoTableView.register(
            UINib(nibName: "ToDoTableViewCell", bundle: nil),
            forCellReuseIdentifier: "ToDoCell")
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
            self?.todoList = data
            self?.todoTableView.reloadData()
        }.store(in: &cancellables)

        viewModel?.$error.compactMap { $0 }.sink { [weak self] message in
            self?.showToast(message: message)
        }.store(in: &cancellables)
    }

    @IBAction func addNewToDo(_ sender: Any) {
        if let createToDoVC = storyboard?.instantiateViewController(
            withIdentifier: "CreateToDoViewController")
            as? CreateToDoViewController
        {
            navigationController?.pushViewController(
                createToDoVC, animated: true)
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {

        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "ToDoCell",
            for: indexPath
        ) as? ToDoTableViewCell {  // Mencari UITableViewCell berdasarkan Identifier.
            let todo = todoList[indexPath.row]
            cell.titleToDoLabel.text = todo.todo

            if todo.completed {
                cell.backgroundStatusLabel.backgroundColor = .systemGreen
                    .withAlphaComponent(0.3)
                cell.statusToDoLabel.text = "Done"
                cell.statusToDoLabel.textColor = .systemGreen
            } else {
                cell.backgroundStatusLabel.backgroundColor = .systemRed
                    .withAlphaComponent(0.3)
                cell.statusToDoLabel.text = "To-do"
                cell.statusToDoLabel.textColor = .systemRed
            }

            return cell
        } else {
            return UITableViewCell()  // Mengembalikan UITableViewCell jika tidak ditemukan.
        }
    }
}

extension MainViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
        let detailStoryBoard = UIStoryboard(name: "Detail", bundle: nil)

        let selectedItem = todoList[indexPath.row]

        if let detailVC = detailStoryBoard.instantiateViewController(
            withIdentifier: "DetailViewController") as? DetailViewController
        {
            detailVC.data = selectedItem

            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

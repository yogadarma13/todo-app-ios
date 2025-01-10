//
//  ToDoInteractor.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//

class ToDoInteractor: ToDoUseCase {
    var repository: PRepository

    init(repository: PRepository) {
        self.repository = repository
    }

    func createToDo(
        text: String, callback: ((ToDoModel) -> Void)?, err: ((String) -> Void)?
    ) {
        repository.createToDo(text: text, callback: callback, err: err)
    }
}

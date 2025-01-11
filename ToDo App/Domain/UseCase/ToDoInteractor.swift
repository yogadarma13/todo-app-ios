//
//  ToDoInteractor.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//
import Combine

class ToDoInteractor: ToDoUseCase {
    var repository: PRepository

    init(repository: PRepository) {
        self.repository = repository
    }

    func getAllToDo() -> AnyPublisher<[ToDoModel], Error> {
        return repository.getAllToDo()
    }

    func createToDo(text: String) -> AnyPublisher<ToDoModel, Error> {
        return repository.createToDo(text: text)
    }
}

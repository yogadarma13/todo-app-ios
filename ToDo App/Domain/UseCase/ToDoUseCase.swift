//
//  ToDoUseCase.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//
import Combine

protocol ToDoUseCase {
    func getAllToDo() -> AnyPublisher<[ToDoModel], Error>
    func createToDo(text: String) -> AnyPublisher<ToDoModel, Error>
}

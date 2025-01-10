//
//  PRepository.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//
import Combine

protocol PRepository {
    func createToDo(text: String) -> AnyPublisher<ToDoModel, Error>
}

//
//  PRepository.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//

protocol PRepository {
    func createToDo(
        text: String, callback: ((ToDoModel) -> Void)?, err: ((String) -> Void)?
    )
}

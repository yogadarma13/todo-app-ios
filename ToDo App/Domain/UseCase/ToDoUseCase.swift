//
//  ToDoUseCase.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//

protocol ToDoUseCase {
    func createToDo(
        text: String, callback: ((ToDoModel) -> Void)?, err: ((String) -> Void)?
    )
}

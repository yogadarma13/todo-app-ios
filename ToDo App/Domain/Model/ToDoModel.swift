//
//  ToDoModel.swift
//  ToDo App
//
//  Created by Yoga Darma on 03/01/25.
//

struct ToDoModel: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}

//
//  ToDoResponseDTO.swift
//  ToDo App
//
//  Created by Yoga Darma on 10/01/25.
//

struct ToDoResponseDTO: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}

//
//  ListToDoResponseDTO.swift
//  ToDo App
//
//  Created by Yoga Darma on 11/01/25.
//

struct ListToDoResponseDTO: Codable {
    let todos: [ToDoResponseDTO]
    let total: Int
    let skip: Int
    let limit: Int
}

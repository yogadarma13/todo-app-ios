//
//  Mapper.swift
//  ToDo App
//
//  Created by Yoga Darma on 10/01/25.
//

struct Mapper {
    static func map(dto: ToDoResponseDTO) -> ToDoModel {
        return ToDoModel(
            id: dto.id,
            todo: dto.todo,
            completed: dto.completed,
            userId: dto.userId
        )
    }
}

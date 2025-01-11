//
//  Repository.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//
import Combine

class Repository: PRepository {
    var remoteDataSource: PRemoteDataSource

    init(remoteDataSource: PRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func getAllToDo() -> AnyPublisher<[ToDoModel], Error> {
        return remoteDataSource.getAllToDo()
            .map { response in
                response.todos.map { data in
                    ToDoModel(
                        id: data.id,
                        todo: data.todo,
                        completed: data.completed,
                        userId: data.userId
                    )
                }
            }
            .eraseToAnyPublisher()
    }

    func createToDo(text: String) -> AnyPublisher<ToDoModel, Error> {
        return remoteDataSource.createToDo(text: text)
            .map { response in Mapper.map(dto: response) }
            .eraseToAnyPublisher()
    }
}

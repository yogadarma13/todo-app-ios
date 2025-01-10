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

    func createToDo(text: String) -> AnyPublisher<ToDoModel, Error> {
        return remoteDataSource.createToDo(text: text)
            .map { Mapper.map(dto: $0) }
            .eraseToAnyPublisher()
    }
}

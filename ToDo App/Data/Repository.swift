//
//  Repository.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//

class Repository: PRepository {
    var remoteDataSource: PRemoteDataSource

    init(remoteDataSource: PRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func createToDo(
        text: String, callback: ((ToDoModel) -> Void)?, err: ((String) -> Void)?
    ) {
        remoteDataSource.createToDo(text: text, callback: callback, err: err)
    }
}

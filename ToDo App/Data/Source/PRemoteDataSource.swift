//
//  PRemoteDataSource.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//
import Combine

protocol PRemoteDataSource {
    func createToDo(text: String) -> AnyPublisher<ToDoResponseDTO, Error>
}

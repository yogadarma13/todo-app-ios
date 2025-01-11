//
//  RemoteDataSource.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//
import Combine
import UIKit

class RemoteDataSource: PRemoteDataSource {
    func getAllToDo() -> AnyPublisher<ListToDoResponseDTO, Error> {
        let url = URL(string: "https://dummyjson.com/todos")!
        return URLSession.shared.dataTaskPublisher(for: url).tryMap { output in
            guard let response = output.response as? HTTPURLResponse,
                (200...299).contains(response.statusCode)
            else {
                throw URLError(.badServerResponse)
            }
            return output.data
        }.decode(type: ListToDoResponseDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func createToDo(text: String) -> AnyPublisher<ToDoResponseDTO, Error> {
        let components = URLComponents(
            string: "https://dummyjson.com/todos/add")!

        let jsonRequest =
            [
                "todo": text,
                "completed": false,
                "userId": 1,
            ] as [String: Any]

        let jsonData = try! JSONSerialization.data(
            withJSONObject: jsonRequest, options: [])

        var request = URLRequest(url: components.url!)

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        return URLSession.shared.dataTaskPublisher(for: request).tryMap {
            output in
            guard let response = output.response as? HTTPURLResponse,
                (200...299).contains(response.statusCode)
            else {
                throw URLError(.badServerResponse)
            }
            return output.data
        }.decode(type: ToDoResponseDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

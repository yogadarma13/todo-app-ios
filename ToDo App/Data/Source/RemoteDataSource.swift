//
//  RemoteDataSource.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//

import UIKit

class RemoteDataSource: PRemoteDataSource {
    func createToDo(
        text: String, callback: ((ToDoModel) -> Void)?, err: ((String) -> Void)?
    ) {
        let components = URLComponents(
            string: "https://dummyjson.com/todos/add")!

        var request = URLRequest(url: components.url!)

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let jsonRequest =
            [
                "todo": text,
                "completed": false,
                "userId": 5,
            ] as [String: Any]

        let jsonData = try! JSONSerialization.data(
            withJSONObject: jsonRequest, options: [])

        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data
            else { return }
            if response.statusCode == 201 {
                let decoder = JSONDecoder()
                let response = try! decoder.decode(ToDoModel.self, from: data)
                callback?(response)
            } else {
                err?("Error")
            }
        }

        task.resume()
    }
}

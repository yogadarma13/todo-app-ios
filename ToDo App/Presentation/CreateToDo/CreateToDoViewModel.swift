//
//  AddToDoViewModel.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//

class CreateToDoViewModel {
    var usecase: ToDoUseCase

    init(usecase: ToDoUseCase) {
        self.usecase = usecase
    }

    func createToDo(
        text: String, callback: ((ToDoModel) -> Void)?, err: ((String) -> Void)?
    ) {
        usecase.createToDo(text: text, callback: callback, err: err)
    }
}

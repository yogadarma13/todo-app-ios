//
//  AddToDoViewModel.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//
import Combine

class CreateToDoViewModel: ObservableObject {
    @Published var loading: Bool = false
    @Published var data: ToDoModel?
    @Published var error: String?

    private var cancellables = Set<AnyCancellable>()

    var usecase: ToDoUseCase

    init(usecase: ToDoUseCase) {
        self.usecase = usecase
    }

    func createToDo(text: String) {
        loading = true
        usecase.createToDo(text: text)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.loading = false

                    switch completion {
                    case .failure(let error):
                        self?.error = error.localizedDescription
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] data in
                    self?.loading = false
                    self?.data = data
                }
            )
            .store(in: &cancellables)
    }
}

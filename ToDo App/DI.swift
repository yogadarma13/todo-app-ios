//
//  DI.swift
//  ToDo App
//
//  Created by Yoga Darma on 09/01/25.
//
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        defaultContainer.register(PRemoteDataSource.self) { _ in
            RemoteDataSource()
        }
        defaultContainer.register(PRepository.self) { r in
            Repository(remoteDataSource: r.resolve(PRemoteDataSource.self)!)
        }
        defaultContainer.register(ToDoUseCase.self) { r in
            ToDoInteractor(repository: r.resolve(PRepository.self)!)
        }
        defaultContainer.register(CreateToDoViewModel.self) { r in
            CreateToDoViewModel(usecase: r.resolve(ToDoUseCase.self)!)
        }
        defaultContainer.register(MainViewModel.self) { r in
            MainViewModel(usecase: r.resolve(ToDoUseCase.self)!)
        }
        defaultContainer.storyboardInitCompleted(MainViewController.self) {
            r, c in
            c.viewModel = r.resolve(MainViewModel.self)
        }
        defaultContainer.storyboardInitCompleted(CreateToDoViewController.self) {
            r, c in
            c.viewModel = r.resolve(CreateToDoViewModel.self)
        }
    }
}

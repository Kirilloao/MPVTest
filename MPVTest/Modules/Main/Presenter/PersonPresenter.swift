//
//  FirstPresenter.swift
//  MPVTest
//
//  Created by Kirill Taraturin on 28.11.2023.
//

import Foundation

protocol PersonPresenterProtocol: AnyObject {
    init(view: PersonViewProtocol, person: Person)
    func showPersonInfo()
}

final class PersonPresenter: PersonPresenterProtocol {

    // MARK: - Private Properties
    private unowned let view: PersonViewProtocol
    private let person: Person
    
    // MARK: - Init
    init(view: PersonViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }

    // MARK: - Public Methods
    func showPersonInfo() {
        let name = person.name
        let age = person.age

        view.displayPersonInfo(name: name, age: age)
    }
}

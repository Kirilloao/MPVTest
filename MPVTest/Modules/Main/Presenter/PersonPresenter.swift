//
//  FirstPresenter.swift
//  MPVTest
//
//  Created by Kirill Taraturin on 28.11.2023.
//

import Foundation

/*
 PersonPresenter отвечает за всю логику представления связанную с объектом Person.
 */
final class PersonPresenter {
    /*
     Свойство view является ссылкой на протокол PersonViewProtocol.
     Weak указывает что это слабая ссылка что помогает предотварить утечки памяти.
     PersonViewProtocol обновляет интерфейс.
     */
    weak var view: PersonViewProtocol?
    /*
     Свойство person представляет модель данных с которой работает презентен.
     Приватное потому что оно доступно только внутри текущего класса.
     */
    private let person: Person
    
    init(view: PersonViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    /*
     Определяем метод внутри которого извлекаем имя и возвраст из person.
     */
    func showPersonInfo() {
        let name = person.name
        let age = person.age
        /*
         Метод displayPersonInfo используется для передачи информации о prson в view для отображения пользователю.
         */
        view?.displayPersonInfo(name: name, age: age)
    }
}

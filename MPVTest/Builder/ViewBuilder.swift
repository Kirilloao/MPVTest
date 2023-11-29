//
//  ViewBuilder.swift
//  MPVTest
//
//  Created by Kirill Taraturin on 29.11.2023.
//

import UIKit

// MARK: - Builder
protocol Builder {
    static func createMainModule() -> UIViewController
//    static func createDetailsModule() -> UIViewController
}

// MARK: - ModuleBuilder
final class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(name: "David", age: "30")
        let view = PersonViewController()
        let presenter = PersonPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
//    
//    static func createDetailsModule() -> UIViewController {
//        let details = Details(description: "")
//        let view = DetailsViewController()
//        let presenter = DetailsPresenter(view: view, details: details)
//        view.presenter = presenter
//        return view
//    }
}

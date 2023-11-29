//
//  DetailsPresenter.swift
//  MPVTest
//
//  Created by Kirill Taraturin on 28.11.2023.
//

import Foundation

protocol DetailsPresenterProtocol: AnyObject {
    init(view: DetailsViewProtocol, details: Details)
    func loadDetails()
}

final class DetailsPresenter: DetailsPresenterProtocol {
    
    // MARK: - Private Properties
    private unowned var view: DetailsViewProtocol
    private let details: Details
    
    // MARK: - Init
    init(view: DetailsViewProtocol, details: Details) {
        self.view = view
        self.details = details
    }
    
    // MARK: - Public Methods
    func loadDetails() {
        view.showDetails(details.description)
    }
}

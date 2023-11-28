//
//  DetailsPresenter.swift
//  MPVTest
//
//  Created by Kirill Taraturin on 28.11.2023.
//

import Foundation

final class DetailsPresenter {
    // MARK: - Public View
    weak var view: DetailsViewProtocol?
    
    // MARK: - Private Properties
    private let details: Details
    
    // MARK: - Init
    init(view: DetailsViewProtocol, details: Details) {
        self.view = view
        self.details = details
    }
    
    // MARK: - Public Methods
    func loadDetails() {
        view?.showDetails(details.description)
    }
}

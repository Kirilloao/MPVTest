//
//  DetailsViewController.swift
//  MPVTest
//
//  Created by Kirill Taraturin on 28.11.2023.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    func showDetails(_ description: String)
}

final class DetailsViewController: UIViewController {
    
    // MARK: - Presenter
    var presenter: DetailsPresenter!
    
    // MARK: - Private UI Properties
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .systemGreen
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: CustomButton = {
        var button = CustomButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action: #selector(closeButtonDidTapped),
            for: .touchUpInside
        )
        return button
    }()

    // MARK: - Life Cycle MEthods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        presenter.loadDetails()
    }
    
    // MARK: - Private Actions
    @objc private func closeButtonDidTapped() {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(descriptionLabel)
        view.addSubview(closeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

// MARK: - DetailsViewProtocol
extension DetailsViewController: DetailsViewProtocol {
    func showDetails(_ description: String) {
        descriptionLabel.text = description
    }
}

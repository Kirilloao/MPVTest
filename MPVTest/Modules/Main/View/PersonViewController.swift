//
//  MainViewController.swift
//  MPVTest
//
//  Created by Kirill Taraturin on 28.11.2023.
//

import UIKit

protocol PersonViewProtocol: AnyObject {
    func displayPersonInfo(name: String, age: String)
}

final class PersonViewController: UIViewController {
    
    // MARK: - Presenter
    var presenter: PersonPresenterProtocol!
    
    // MARK: - Private UI Properties
    private lazy var mainStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        var name = UILabel()
        return name
    }()
    
    private lazy var ageLabel: UILabel = {
        var age = UILabel()
        return age
    }()
    
    private lazy var nextVCButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Show DetailsVC", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        button.addTarget(
            self,
            action: #selector(showDetailsVC),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        setupPresenter()
    }
    
    // MARK: - Private Actions
    @objc private func showDetailsVC() {
        let description = "Name: \(nameLabel.text ?? "") Age: \(ageLabel.text ?? "")"
        let details = Details(description: description)
        let detailsVC = DetailsViewController()
        detailsVC.presenter = DetailsPresenter(view: detailsVC, details: details)
        present(detailsVC, animated: true)
    }
    
    // MARK: - Private Methods
    private func setupPresenter() {
        presenter = PersonPresenter(view: self, person: Person(name: "Alex", age: "55"))
        presenter.showPersonInfo()
    }
    
    private func setViews() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        view.addSubview(nextVCButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nextVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextVCButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 40),
            nextVCButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
}

// MARK: - PersonViewProtocol
extension PersonViewController: PersonViewProtocol {
    func displayPersonInfo(name: String, age: String) {
        nameLabel.text = name
        ageLabel.text = age
    }
}

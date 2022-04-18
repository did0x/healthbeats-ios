//
//  SimpleViewController.swift
//  healthbeats
//
//  Created by Ridho Saputra on 16/04/22.
//

import UIKit

class SimpleViewController: UIViewController {
    
    private var titleText: String!
    private let subtitleLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    init(titleText: String) {
        self.titleText = titleText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayBackground
        setupHierarchy()
        setupLayout()
        setupProperties()
        // Do any additional setup after loading the view.
        addLogoToNavigationBarItem()
    }
    
    private func setupHierarchy() {
        view.addSubviews(subtitleLabel, titleLabel, descriptionLabel)
    }
    
    private func setupLayout() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
    }
    
    private func setupProperties() {
        subtitleLabel.configureWith(getCurrentDate(), color: .gray, alignment: .left, size: 16)
        titleLabel.configureWith(titleText, color: .black, alignment: .left, size: 32, weight: .bold)
        descriptionLabel.configureWith("Coming Soon!", color: .black, alignment: .center, size: 48, weight: .bold)
    }
}

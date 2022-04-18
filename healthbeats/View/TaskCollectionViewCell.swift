//
//  TaskCollectionViewCell.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    
    let containerView = UIView()
    let nameLabel = UILabel()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let imageView = ScaleAspectFitImageView()
    let progressView = UIProgressView()
    let ruleLabel = UILabel()
    let amountLabel = UILabel()
    let button = ActionButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup View
    
    private func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubviews(nameLabel, titleLabel, descriptionLabel, imageView, progressView, ruleLabel, amountLabel, button)
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        imageView.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -12).isActive = true
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12).isActive = true
        progressView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        progressView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 6).isActive = true
        
        ruleLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 12).isActive = true
        ruleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 12).isActive = true
        amountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 12).isActive = true
        button.topAnchor.constraint(equalTo: ruleLabel.bottomAnchor, constant: 12).isActive = true
        button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12).isActive = true
    }
    
    private func setupProperties() {
        containerView.backgroundColor = .white
        containerView.setupCornerRadius(12)
        
        nameLabel.configureWith("BYOD PO Programee 1", color: .black, alignment: .left, size: 16)
        
        titleLabel.configureWith("Oxygen Saturation and Heart Rate", color: .black, alignment: .left, size: 24, weight: .bold)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        descriptionLabel.configureWith("Please use your own device to take the measurement and tap `Add Result` button below to input your results", color: .gray, alignment: .left, size: 14)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.setupCornerRadius(12)
        
        progressView.layoutIfNeeded()
        progressView.setProgress(1, animated: true)
        progressView.progressTintColor = .primary
        
        ruleLabel.configureWith("10.00 - 12.00", color: .black, alignment: .left, size: 14)
        
        amountLabel.configureWith("(Taken 0/1)", color: .black, alignment: .left, size: 14)
        
        button.setTitle("Add Result", for: .normal)
    }
}

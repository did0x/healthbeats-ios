//
//  TaskCollectionViewCell.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit

class PlanCollectionViewCell: UICollectionViewCell {
    
    let containerView = UIView()
    let maskedView = UIView()
    let nameLabel = UILabel()
    let locationLabel = UILabel()
    let imageView = UIImageView()
    let iconImageView = UIImageView()
    
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
        containerView.addSubviews(imageView, maskedView, iconImageView, nameLabel, locationLabel)
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 4).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12).isActive = true
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 12).isActive = true
        iconImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -12).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        maskedView.translatesAutoresizingMaskIntoConstraints = false
        maskedView.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: -12).isActive = true
        maskedView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        maskedView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        maskedView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    private func setupProperties() {
        nameLabel.configureWith("BYOD PO Programee 1", color: .white, alignment: .left, size: 16, weight: .bold)
        
        locationLabel.configureWith("Oxygen Saturation and Heart Rate", color: .white, alignment: .left, size: 14)
        locationLabel.lineBreakMode = .byWordWrapping
        locationLabel.numberOfLines = 0
        
        imageView.backgroundColor = .gray
        imageView.setupCornerRadius(12)
        imageView.clipsToBounds = true
        
        iconImageView.backgroundColor = .white
        iconImageView.setupCornerRadius(12)
        
        maskedView.backgroundColor = .black.withAlphaComponent(0.2)
        maskedView.setupCornerRadius(12)
    }
}

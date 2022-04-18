//
//  CarePlanViewController.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit

class CarePlanViewController: UIViewController {
    
    private var arrOfPlan: [Plan] = []
    
    private let subtitleLabel = UILabel()
    private let titleLabel = UILabel()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private let collectionFlowLayout = UICollectionViewFlowLayout.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayBackground
        arrOfPlan = PlanFeeder().arrOfPlan
        setupHierarchy()
        setupLayout()
        setupProperties()
        setupCollectionView()
        // Do any additional setup after loading the view.
        addLogoToNavigationBarItem()
    }
    
    private func setupHierarchy() {
        view.addSubviews(subtitleLabel, titleLabel, collectionView)
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
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setupCollectionView() {
        collectionFlowLayout.itemSize = CGSize(width: view.bounds.width , height: 180)
        collectionFlowLayout.minimumInteritemSpacing = 16
        collectionFlowLayout.minimumLineSpacing = 16
        collectionFlowLayout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(collectionFlowLayout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(PlanCollectionViewCell.self, forCellWithReuseIdentifier: "PlanCell")
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 24, right: 0)
        collectionView.alwaysBounceVertical = true
    }
    
    private func setupProperties() {
        subtitleLabel.configureWith(getCurrentDate(), color: .gray, alignment: .left, size: 16)
        titleLabel.configureWith("Care Plans", color: .black, alignment: .left, size: 32, weight: .bold)
    }
}

// MARK: - Handle Collection

extension CarePlanViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfPlan.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanCell", for: indexPath) as! PlanCollectionViewCell
        cell.nameLabel.text = arrOfPlan[indexPath.row].name
        cell.locationLabel.text = arrOfPlan[indexPath.row].location
        cell.imageView.image = arrOfPlan[indexPath.row].image
        cell.iconImageView.image = UIImage(named: arrOfPlan[indexPath.row].type)?.withTintColor(.gray, renderingMode: .alwaysOriginal).imageWithInsets(insets: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
        return cell
    }
    
    
}

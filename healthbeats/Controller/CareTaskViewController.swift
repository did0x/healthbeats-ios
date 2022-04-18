//
//  CarePlanViewController.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit

class CareTaskViewController: UIViewController {
    
    private var arrOfTask: [Task] = []
    
    private let subtitleLabel = UILabel()
    private let titleLabel = UILabel()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private let collectionFlowLayout = UICollectionViewFlowLayout.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayBackground
        arrOfTask = TaskFeeder().arrOfTask
        setupHierarchy()
        setupLayout()
        setupProperties()
        // Do any additional setup after loading the view.
        addLogoToNavigationBarItem()
    }
    
    override func viewDidLayoutSubviews() {
        setupCollectionView()
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
        collectionFlowLayout.itemSize = CGSize(width: view.bounds.width - 64, height: collectionView.contentSize.height)
        collectionFlowLayout.minimumInteritemSpacing = 16
        collectionFlowLayout.minimumLineSpacing = 16
        collectionFlowLayout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(collectionFlowLayout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(TaskCollectionViewCell.self, forCellWithReuseIdentifier: "TaskCell")
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 24, right: 16)
        collectionView.alwaysBounceHorizontal = true
    }
    
    private func setupProperties() {
        subtitleLabel.configureWith(getCurrentDate(), color: .gray, alignment: .left, size: 16)
        titleLabel.configureWith("Today's Task", color: .black, alignment: .left, size: 32, weight: .bold)
    }
}

// MARK: - Handle Collection

extension CareTaskViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrOfTask.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCell", for: indexPath) as! TaskCollectionViewCell
        cell.nameLabel.text = arrOfTask[indexPath.row].name
        cell.titleLabel.text = arrOfTask[indexPath.row].title
        cell.descriptionLabel.text = arrOfTask[indexPath.row].description
        cell.imageView.image = arrOfTask[indexPath.row].image
        cell.ruleLabel.text = arrOfTask[indexPath.row].rule
        cell.amountLabel.text = "Taken \(arrOfTask[indexPath.row].currentAmount)/\(arrOfTask[indexPath.row].amount)"
        cell.button.setTitle(arrOfTask[indexPath.row].action, for: .normal)
        cell.button.addTarget(self, action: #selector(taskAction), for: .touchUpInside)
        return cell
    }
    
    @objc private func taskAction() {
        sendNotification(title: "Result Successful Added", message: "You successfully make progress to the task", identifier: "taskMessage")
    }
}

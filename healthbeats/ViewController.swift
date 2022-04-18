//
//  ViewController.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let label = PaddingLabel(top: 12, left: 18, bottom: 12, right: 18, color: .systemIndigo)
    private let progressView = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubviews(label, progressView)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 24).isActive = true
        progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        
        label.configureWith("Hello World", color: .white, alignment: .center, size: 14, weight: .bold)
        progressView.layoutIfNeeded()
        progressView.setProgress(1, animated: true)
    }

}


//
//  LoginViewController.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit
import UserNotifications

class LoginViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    private var numberField: NumberTextField!
    private let passwordField = PasswordTextField()
    private let button = ActionButton()
    
    private var numberNotEmpty = false
    private var passwordNotEmpty = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberField = NumberTextField(rootViewController: self)
        numberField.delegate = self
        passwordField.delegate = self
        setupHierarchy()
        setupLayout()
        setupProperties()
        // Do any additional setup after loading the view.
    }
    
    private func setupHierarchy() {
        view.addSubviews(logoImageView, numberField, passwordField, button)
    }
    
    private func setupLayout() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 86).isActive = true
        logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -86).isActive = true
        
        numberField.translatesAutoresizingMaskIntoConstraints = false
        numberField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24).isActive = true
        numberField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        numberField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        numberField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.topAnchor.constraint(equalTo: numberField.bottomAnchor, constant: 18).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 24).isActive = true
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
    }
    
    private func setupProperties() {
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFit
        
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.isEnabled = numberNotEmpty && passwordNotEmpty
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    
    
    @objc private func signIn() {
        if numberField.textField.text == "12345678" && numberField.numberButton.title(for: .normal) == "+65" && passwordField.textField.text == "HealthBeats123!" {
            sendNotification(title: "Login Successful", message: "You successfully login to the app", identifier: "loginMessage")
            performSegue(withIdentifier: "SigninSegue", sender: nil)
        } else {
            showMessage(title: "Login Failed", message: "Your mobile number or password is incorrect. Please double-check and try again.", action: "Try Again")
        }
    }
}

extension LoginViewController: NumberTextFieldDelegate, PasswordTextFieldDelegate {
    
    func passwordTextField(isEmpty: Bool) {
        passwordNotEmpty = !isEmpty
        button.isEnabled = numberNotEmpty && passwordNotEmpty
    }
    
    func numberTextField(isEmpty: Bool) {
        numberNotEmpty = !isEmpty
        button.isEnabled = numberNotEmpty && passwordNotEmpty
    }
}

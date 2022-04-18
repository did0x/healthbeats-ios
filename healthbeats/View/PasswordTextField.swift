//
//  ActionTextField.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit

public protocol PasswordTextFieldDelegate: AnyObject {
    func passwordTextField(isEmpty: Bool)
}

class PasswordTextField: UIView {
    open var delegate: PasswordTextFieldDelegate?

    let textField = UITextField()
    private let backgroundView = UIView()
    private let placeholderLabel = PaddingLabel()
    private let visibiltyButton = UIButton()
    
    
    private var labelCenterYAnchorConstraint: NSLayoutConstraint!
    private var labelLeadingAnchorConstraint: NSLayoutConstraint!
    
    init() {
        super.init(frame: .zero)
        textField.delegate = self
        setupHierarchy()
        setupLayout()
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupHierarchy() {
        addSubviews(backgroundView, textField, placeholderLabel, visibiltyButton)
    }
    
    private func setupLayout() {
        let margins = self.layoutMarginsGuide
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: visibiltyButton.leadingAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        labelCenterYAnchorConstraint = placeholderLabel.centerYAnchor.constraint(equalTo: textField.centerYAnchor, constant: 0)
        labelCenterYAnchorConstraint.isActive = true
        labelLeadingAnchorConstraint = placeholderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 6)
        labelLeadingAnchorConstraint.isActive = true
        placeholderLabel.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        
        visibiltyButton.translatesAutoresizingMaskIntoConstraints = false
        visibiltyButton.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        visibiltyButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        visibiltyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setupProperties() {
        backgroundView.addBorderAndColor(color: .gray, width: 1, radius: 12)
        textField.setLeftPaddingPoints(10)
        textField.isSecureTextEntry = true
        placeholderLabel.backgroundColor = .white
        placeholderLabel.configureWith("Password", color: .gray.withAlphaComponent(0.5), alignment: .left, size: 16)
        
        visibiltyButton.setImage(UIImage(systemName: "eye.slash.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        visibiltyButton.addTarget(self, action: #selector(visibiltyChange), for: .touchUpInside)
        
    }
    
    @objc func visibiltyChange(sender: UIButton) {
        textField.isSecureTextEntry = !textField.isSecureTextEntry
        visibiltyButton.setImage(
            textField.isSecureTextEntry ? UIImage(systemName: "eye.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal) : UIImage(systemName: "eye.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
            , for: .normal)
    }
    
}

extension PasswordTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        self.delegate?.passwordTextField(isEmpty: (text?.isEmpty ?? true))
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        labelCenterYAnchorConstraint.constant = -28
        labelLeadingAnchorConstraint.constant = 0
        self.placeholderLabel.textColor = .primary
        self.backgroundView.addBorderAndColor(color: .primary, width: 1, radius: 12)
        performAnimate(transform: CGAffineTransform(scaleX: 0.8, y: 0.8))
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            labelCenterYAnchorConstraint.constant = 0
            labelLeadingAnchorConstraint.constant = 6
            performAnimate(transform: CGAffineTransform(scaleX: 1, y: 1))
        }
        self.placeholderLabel.textColor = .gray.withAlphaComponent(0.5)
        self.backgroundView.addBorderAndColor(color: .gray, width: 1, radius: 12)
    }
    
    fileprivate func performAnimate(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.placeholderLabel.transform = transform
            self.layoutIfNeeded()
        }, completion: nil)
    }
}

//
//  ActionTextField.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit

public protocol NumberTextFieldDelegate: AnyObject {
    func numberTextField(isEmpty: Bool)
}

class NumberTextField: UIView {
    open var delegate: NumberTextFieldDelegate?
    
    let textField = UITextField()
    let numberButton = UIButton()
    private let backgroundView = UIView()
    private let placeholderLabel = PaddingLabel()
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    private let phoneNumber = [PhoneNumber(code: "+1", country: "Canada"), PhoneNumber(code: "+1", country: "United State"), PhoneNumber(code: "+62", country: "Australia"), PhoneNumber(code: "+65", country: "Singapore")]
    
    private var rootViewController: UIViewController!
    
    private var selectedRow = 3
    private var labelCenterYAnchorConstraint: NSLayoutConstraint!
    private var labelLeadingAnchorConstraint: NSLayoutConstraint!
    
    init(rootViewController : UIViewController) {
        super.init(frame: .zero)
        self.rootViewController = rootViewController
        textField.delegate = self
        setupHierarchy()
        setupLayout()
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupHierarchy() {
        addSubviews(backgroundView, textField, placeholderLabel, numberButton)
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
        textField.leadingAnchor.constraint(equalTo: numberButton.trailingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        labelCenterYAnchorConstraint = placeholderLabel.centerYAnchor.constraint(equalTo: textField.centerYAnchor, constant: 0)
        labelCenterYAnchorConstraint.isActive = true
        labelLeadingAnchorConstraint = placeholderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 6)
        labelLeadingAnchorConstraint.isActive = true
        placeholderLabel.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        
        numberButton.translatesAutoresizingMaskIntoConstraints = false
        numberButton.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
        numberButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        numberButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    }
    
    private func setupProperties() {
        backgroundView.addBorderAndColor(color: .gray, width: 1, radius: 12)
        textField.setLeftPaddingPoints(10)
        textField.keyboardType = .numberPad
        placeholderLabel.backgroundColor = .white
        placeholderLabel.configureWith("Mobile Number", color: .gray.withAlphaComponent(0.5), alignment: .left, size: 16)
        
        numberButton.setTitle("+65", for: .normal)
        numberButton.setTitleColor(.gray, for: .normal)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "arrowtriangle.down.fill")?.resizeImageTo(size: CGSize(width: 10, height: 5))
        config.titlePadding = 0
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 12)
        numberButton.configuration = config
        numberButton.addTarget(self, action: #selector(popUp), for: .touchUpInside)
    }
    
    @objc private func popUp() {
        let viewController = UIViewController()
        viewController.preferredContentSize = CGSize(width: screenWidth - 10, height: screenHeight / 5.5)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth - 10, height: screenHeight / 5.5))
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.selectRow(selectedRow, inComponent: 0, animated: true)
        
        viewController.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Select Mobile Number", message: "", preferredStyle: .actionSheet)
        alert.setValue(viewController, forKey: "contentViewController")
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(UIAlertAction) in
        }))
        alert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: {(UIAlertAction) in
            self.selectedRow = pickerView.selectedRow(inComponent: 0)
            let selectedPhoneNumber = Array(self.phoneNumber)[self.selectedRow]
            self.numberButton.setTitle(selectedPhoneNumber.code, for: .normal)
        }))
        rootViewController.present(alert, animated: true, completion: nil)
    }
    
}

extension NumberTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth - 10, height: 10))
        label.text = "\(phoneNumber[row].country) \(phoneNumber[row].code)"
        label.sizeToFit()
        return label
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return phoneNumber.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 48
    }
}

extension NumberTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        self.delegate?.numberTextField(isEmpty: (text?.isEmpty ?? true))
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        labelCenterYAnchorConstraint.constant = -28
        labelLeadingAnchorConstraint.constant = -72
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

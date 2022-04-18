//
//  Extensions.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import Foundation

import UIKit


public extension UIColor {
    
    static let primary = UIColor(red: 1.0, green: 0.32, blue: 0.0, alpha: 1)
    static let primaryGreen = UIColor(red: 0.31, green: 0.69, blue: 0.36, alpha: 1)
    static let primaryYellow = UIColor(red: 0.95, green: 0.72, blue: 0.27, alpha: 1)
    static let primaryOrange = UIColor(red: 0.89, green: 0.51, blue: 0.25, alpha: 1)
    static let primaryRed = UIColor(red: 0.74, green: 0.28, blue: 0.21, alpha: 1)
    static let gray = UIColor(red: 0.32, green: 0.31, blue: 0.32, alpha: 1)
    static let grayBackground = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
    
}

extension UILabel {
    func configureWith(_ text: String,
                       color: UIColor,
                       alignment: NSTextAlignment,
                       size: CGFloat,
                       weight: UIFont.Weight = .regular) {
        self.font = .systemFont(ofSize: size, weight: weight)
        self.text = text
        self.textColor = color
        self.textAlignment = alignment
    }
}

extension UIView {
    func setupCornerRadius(_ cornerRadius: CGFloat = 0, maskedCorners: CACornerMask? = nil) {
        self.layer.cornerRadius = cornerRadius
        if let corners = maskedCorners {
            self.layer.maskedCorners = corners
        }
    }
    
    func animateClick(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.15) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        } completion: { _ in
            UIView.animate(withDuration: 0.15) {
                self.transform = CGAffineTransform.identity
            } completion: { _ in completion() }
        }
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 7
    }
    
    func addBorderAndColor(color: UIColor, width: CGFloat, radius: CGFloat = 0) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func applyGradient(colours: [UIColor]) {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        self.subviews.forEach { addArrangedSubview($0) }
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UIImage {
    
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
    func imageWithInsets(insets: UIEdgeInsets) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let _ = UIGraphicsGetCurrentContext()
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets
    }
}

extension UIViewController {
    
    func addLogoToNavigationBarItem() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage( named: "logo")
        
        // In order to center the title view image no matter what buttons there are, do not set the
        // image view as title view, because it doesn't work. If there is only one button, the image
        // will not be aligned. Instead, a content view is set as title view, then the image view is
        // added as child of the content view. Finally, using constraints the image view is aligned
        // inside its parent.
        let contentView = UIView()
        self.navigationItem.titleView = contentView
        self.navigationItem.titleView?.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func sendNotification(title: String, message: String, identifier: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = message
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if (error != nil) {
                print(error!)
            } else {
                print("Success! ID:\(identifier), Message:\(message), Time:\(trigger.timeInterval.magnitude) seconds")
            }
        }
    }
    
    func showMessage(title: String, message: String, action: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default, handler: {(UIAlertAction) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getCurrentDate() -> String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter.string(from: currentDateTime)
    }
}

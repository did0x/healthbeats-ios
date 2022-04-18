//
//  ActionButton.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit

class ActionButton: UIButton {
    
    private var insets = NSDirectionalEdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
    }
    
    init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        super.init(frame: .zero)
        insets = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupProperties() {
        var config = UIButton.Configuration.plain()
        config.contentInsets = insets
        configuration = config
        backgroundColor = .primary
        setTitleColor(.white, for: .normal)
        setupCornerRadius(12)
    }
    
    override func updateConfiguration() {
        guard let configuration = configuration else {
            return
        }
        
        var updatedConfiguration = configuration
        
        var background = UIButton.Configuration.plain().background
        background.cornerRadius = 12
        
        let foregroundColor: UIColor
        let backgroundColor: UIColor
        let baseColor = UIColor.primary
        
        switch self.state {
        case .normal:
            foregroundColor = .white
            backgroundColor = baseColor
        case [.highlighted]:
            foregroundColor = .white
            backgroundColor = baseColor.withAlphaComponent(0.3)
        case .selected:
            foregroundColor = .white
            backgroundColor = baseColor
        case [.selected, .highlighted]:
            foregroundColor = .white
            backgroundColor = baseColor.withAlphaComponent(0.5)
        case .disabled:
            foregroundColor = .gray.withAlphaComponent(0.5)
            backgroundColor = .grayBackground
        default:
            foregroundColor = baseColor
            backgroundColor = .clear
        }
        
        background.backgroundColor = backgroundColor
        
        updatedConfiguration.baseForegroundColor = foregroundColor
        updatedConfiguration.background = background
        
        self.configuration = updatedConfiguration
    }
}

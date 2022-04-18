//
//  PaddingLabel.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import UIKit

class PaddingLabel: UILabel {
    
    var padding = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat, color: UIColor, corner: CGFloat = 12) {
        super.init(frame: .zero)
        self.padding = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        backgroundColor = color
        layer.masksToBounds = true
        layer.cornerRadius = corner
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
    
}

//
//  CustomButton.swift
//  CoreFramework
//
//  Created by Ronan Fernandes on 07/07/26.
//

import UIKit
import Foundation

public protocol CustomButtonDelegate: AnyObject {
    func buttonAction()
}

public class CustomButton: UIButton {
    weak var delegate: CustomButtonDelegate?
    private var iconPosition: NSLayoutConstraint.Axis?
    
    private var customWidth: CGFloat?
    
    public init(
        title: String,
        backgroundColor: UIColor = Colors.primaryRedBase
    ) {
        super.init(frame: .zero)
        setupButton(
            title: title,
            icon: nil,
            iconPosition: nil,
            backgroundColor: backgroundColor
        )
    }
    
    public init(
        title: String,
        icon: UIImage,
        iconPosition: NSLayoutConstraint.Axis?,
        backgroundColor: UIColor = Colors.primaryRedBase
    ) {
        super.init(frame: .zero)
        setupButton(
            title: title,
            icon: icon,
            iconPosition: iconPosition,
            backgroundColor: backgroundColor
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(
        title: String,
        icon: UIImage?,
        iconPosition: NSLayoutConstraint.Axis?,
        backgroundColor: UIColor
    ) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = Typography.subHeading
        self.setTitleColor(Colors.gray800, for: .normal)
        self.layer.cornerRadius = Metrics.medium
        self.isEnabled = true
        
        if let icon = icon, let iconPosition = iconPosition {
            self.setImage(icon, for: .normal)
            self.tintColor = .white
            self.iconPosition = iconPosition
            adjustIconPosition()
        }
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func adjustIconPosition() {
        guard let iconPosition = iconPosition else { return }
        
        if #available(iOS 15.0, *) {
            var config = self.configuration ?? UIButton.Configuration.plain()
            config.imagePlacement = iconPosition == .horizontal ? .leading : .top
            config.imagePadding = 8
            self.configuration = config
        } else {
            if iconPosition == .horizontal {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
            } else {
                imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
            }
        }
    }
    
    @objc
    private func buttonTapped() {
        delegate?.buttonAction()
    }
}

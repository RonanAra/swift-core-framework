//
//  ToggleCheckbox.swift
//  CoreFramework
//
//  Created by Ronan Fernandes on 07/07/26.
//

import Foundation
import UIKit

public class ToggleCheckbox: UIButton {
    
    private var isChecked: Bool = false
    private let checkedImage = UIImage(named: "CheckedCheckbox")
    private let uncheckedImage = UIImage(named: "UncheckedCheckbox")
    
    
    public init() {
        super.init(frame: .zero)
        self.setImage(uncheckedImage, for: .normal)
        self.addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func toggle() {
        isChecked.toggle()
        self.setImage(isChecked ? checkedImage : uncheckedImage, for: .normal)
    }
    
    public func getIsCheckedState() -> Bool {
        return isChecked
    }
}

//
//  ExampleCheckboxViewController.swift
//  CoreFramework
//
//  Created by Ronan Fernandes on 07/07/26.
//

import Foundation
import UIKit

public class ExampleCheckboxViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let checkbox = ToggleCheckbox()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(checkbox)
        
        NSLayoutConstraint.activate([
            checkbox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkbox.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            checkbox.heightAnchor.constraint(equalToConstant: 50),
            checkbox.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

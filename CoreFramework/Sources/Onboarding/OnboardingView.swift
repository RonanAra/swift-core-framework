//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by Ronan Fernandes on 31/05/26.
//

import UIKit
import Foundation

public class OnboardingView: UIView {
    private var steps: [String] = []
    private var currentStep = 0
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray100.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray300
        label.font = Typography.heading
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Próximo", for: .normal)
        button.setTitleColor(Colors.primaryRedBase, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backgroundView)
        addSubview(messageLabel)
        addSubview(nextButton)
        addTargets()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            nextButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Metrics.medium),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    public func presentOnboarding(on view: UIView, with steps: [String]) {
        self.steps = steps
        self.currentStep = 0
        
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    fileprivate func addTargets() {
        nextButton.addTarget(
            self,
            action: #selector(didTapNextStep),
            for: .touchUpInside
        )
    }
    
    @objc
    private func didTapNextStep() {
        currentStep += 1
        if currentStep < steps.count {
            updateStep()
        } else {
            dismiss()
        }
    }
    
    private func updateStep() {
        messageLabel.text = steps[currentStep]
    }
    
    private func dismiss() {
        removeFromSuperview()
    }
}

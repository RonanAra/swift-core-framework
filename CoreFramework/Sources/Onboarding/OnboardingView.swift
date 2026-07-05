//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by Ronan Fernandes on 31/05/26.
//

import UIKit
import Foundation

public class OnboardingView: UIView {
    private var steps: [(image: UIImage?, text: String)] = []
    private var currentStep = 0
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray100.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.gray700
        label.font = Typography.heading
        label.numberOfLines = 0
        label.textAlignment = .center
        label.alpha = 0
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
        addSubview(imageView)
        addTargets()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Metrics.medium),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            nextButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: Metrics.medium),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    public func presentOnboarding(on view: UIView, with steps: [(image: UIImage?, text: String)]) {
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
        
        updateStep(animated: true)
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
    
    private func updateStep(animated: Bool = false) {
        let step = steps[currentStep]
        imageView.image = step.image
        messageLabel.text = step.text
        
        if animated {
            animateTextEntry()
        } else {
            messageLabel.alpha = 1
            messageLabel.transform = .identity
        }
    }
    
    private func animateTextEntry() {
        messageLabel.alpha = 0
        messageLabel.transform = CGAffineTransform(translationX: -UIScreen().bounds.width, y: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.messageLabel.alpha = 1
            self.transform = .identity
        }
    }
    
    private func dismiss() {
        removeFromSuperview()
    }
}

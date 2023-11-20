//
//  ViewController.swift
//  HW-4(Constraints, Stack, ScrollView)
//
//  Created by d0bsson on 19.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scroll = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true
        scroll.addSubview(scrollContent)
        return scroll
    }()
    
    lazy var scrollContent = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var fruitAppLabel: UILabel = {
        let title = UILabel()
        title.text = "FruitApp"
        title.font = UIFont.systemFont(ofSize: 24, weight: .black)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var orangeLabel = {
        let label = UILabel()
        label.text = "Orange"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var appleLabel = {
        let label = UILabel()
        label.text = "Apple"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var limeLabel = {
        let label = UILabel()
        label.text = "Lime  "
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var appleImage = {
        let image = UIImageView()
        image.image = UIImage(named: "apple")
        image.layer.cornerRadius = 50
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    lazy var orangeImage = {
        let image = UIImageView()
        image.image = UIImage(named: "orange")
        image.layer.cornerRadius = 50
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    lazy var limeImage = {
        let image = UIImageView()
        image.image = UIImage(named: "lime")
        image.layer.cornerRadius = 50
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    lazy var hStackApple = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 13
        stack.addArrangedSubview(appleImage)
        stack.addArrangedSubview(appleLabel)
        stack.addArrangedSubview(buttonApple)
        return stack
    }()
    
    lazy var hStackOrange = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        stack.addArrangedSubview(orangeImage)
        stack.addArrangedSubview(orangeLabel)
        stack.addArrangedSubview(buttonOrange)
        return stack
    }()
    
    lazy var hStackLime = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 12
        stack.addArrangedSubview(limeImage)
        stack.addArrangedSubview(limeLabel)
        stack.addArrangedSubview(buttonLime)
        return stack
    }()
    
    lazy var buttonNext = {
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(_colorLiteralRed: 0/255, green: 169/255, blue: 7/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonOrange = {
        let button = UIButton()
        button.setTitle("Показать описание", for: .normal)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(_colorLiteralRed: 0/255, green: 169/255, blue: 7/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonApple = {
        let button = UIButton()
        button.setTitle("Показать описание", for: .normal)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(_colorLiteralRed: 0/255, green: 169/255, blue: 7/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonLime = {
        let button = UIButton(primaryAction: buttonLimeAction)
        button.setTitle("Показать", for: .normal)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(_colorLiteralRed: 0/255, green: 169/255, blue: 7/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonLimeAction =  UIAction { _ in
        self.changeDiscription(of: "lime")
        print("123")
    }
    
    
    lazy var textView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textLabel = {
        let text = UILabel()
        text.text = "Здесь будет описание фрукта :)"
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scroll)
        
        scrollContent.addSubview(fruitAppLabel)
        scrollContent.addSubview(hStackOrange)
        scrollContent.addSubview(hStackApple)
        scrollContent.addSubview(hStackLime)
        scrollContent.addSubview(buttonNext)
        scrollContent.addSubview(textView)
        textView.addSubview(textLabel)
        
        setupView()
    }
    
    private func setupView() {
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollContent.topAnchor.constraint(equalTo: scroll.topAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            
            scrollContent.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            
            orangeImage.heightAnchor.constraint(equalToConstant: 100),
            orangeImage.widthAnchor.constraint(equalToConstant: 130),
            
            appleImage.heightAnchor.constraint(equalToConstant: 100),
            appleImage.widthAnchor.constraint(equalToConstant: 130),
            
            limeImage.heightAnchor.constraint(equalToConstant: 100),
            limeImage.widthAnchor.constraint(equalToConstant: 130),
            
            fruitAppLabel.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 20),
            fruitAppLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            fruitAppLabel.widthAnchor.constraint(equalToConstant: 300),
            
            hStackOrange.topAnchor.constraint(equalTo: fruitAppLabel.bottomAnchor, constant: 20),
            hStackOrange.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            hStackOrange.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            
            hStackApple.topAnchor.constraint(equalTo: hStackOrange.bottomAnchor, constant: 8),
            hStackApple.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            hStackApple.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            
            hStackLime.topAnchor.constraint(equalTo: hStackApple.bottomAnchor, constant: 8),
            hStackLime.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            hStackLime.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            
            buttonNext.heightAnchor.constraint(equalToConstant: 59),
            buttonNext.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 16),
            buttonNext.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -16),
            buttonNext.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -38),
            
            textView.topAnchor.constraint(equalTo: limeImage.bottomAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            
            textLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 8),
            textLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -8),
            textLabel.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: -8),
            
        ])
    }
    
    private func changeDiscription(of label: String) {
        if label == "orange" {
            textLabel.text = "про апельсин"
        } else if label == "apple" {
            textLabel.text = "про яблоко"
        } else if label == "lime" {
            textLabel.text = "про лайм"
            print("lime")
        }
    }
    
}


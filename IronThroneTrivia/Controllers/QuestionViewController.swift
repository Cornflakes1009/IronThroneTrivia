//
//  QuestionViewController.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 9/9/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    let background: UIImageView = {
        let image = UIImageView()
        image.image = backgroundImage
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = true
        button.tintColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1)
        button.setTitleColor(buttonTitleColor, for: .normal)
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = instructionLabelFont
        label.textAlignment = .center
        label.textColor = buttonTitleColor
        label.numberOfLines = 0
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = instructionLabelFont
        label.textAlignment = .center
        label.textColor = buttonTitleColor
        return label
    }()
    
    let optionZeroButton: GameButton = {
        let button = GameButton(title: "")
        return button
    }()
    
    let optionOneButton: GameButton = {
        let button = GameButton(title: "")
        return button
    }()
    
    let optionTwoButton: GameButton = {
        let button = GameButton(title: "")
        return button
    }()
    
    let optionThreeButton: GameButton = {
        let button = GameButton(title: "")
        return button
    }()
    
    // MARK:- Exit Confirmation
    let exitConfirmationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.alpha = 0
        view.isOpaque = true
        return view
    }()
    
    let exitConfirmationLabel: UILabel = {
        let label = UILabel()
        label.text = "Are you sure you wish to exit? This will exit the game and you'll lose your current progress"
        label.font = instructionLabelFont
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let exitGameCancel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1), for: .normal)
        button.titleLabel?.font = canceViewButtonFont
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1).cgColor
        button.titleLabel?.layer.shadowRadius = 0.5
        button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        return button
    }()
    
    let exitGameConfirm: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Exit", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1), for: .normal)
        button.titleLabel?.font = canceViewButtonFont
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1).cgColor
        button.titleLabel?.layer.shadowRadius = 0.5
        button.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK:- Setting up views
    func setupViews() {
        updateLabels()
        view.addSubview(background)
        background.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        let backButtonImageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
        let backButtonImage = UIImage(systemName: "chevron.left.square", withConfiguration: backButtonImageConfig)
        
        backButton.setImage(backButtonImage, for: .normal)
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(questionLabel)
        questionLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        setupStackView()
    }
    
    func updateLabels() {
        questionLabel.text = "\(questionList[questionIndex].question)"
        optionZeroButton.setTitle(questionList[questionIndex].optionZero, for: .normal)
        optionOneButton.setTitle(questionList[questionIndex].optionOne, for: .normal)
        optionTwoButton.setTitle(questionList[questionIndex].optionTwo, for: .normal)
        optionThreeButton.setTitle(questionList[questionIndex].optionThree, for: .normal)
    }
    
    // MARK:- StackView
    var stackView = UIStackView()
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [optionZeroButton, optionOneButton, optionTwoButton, optionThreeButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        // calculating based on the number of buttons in stack view and adding 20 padding
        let stackViewHeight = CGFloat(Int(buttonHeight) * stackView.arrangedSubviews.count + 40)
        
        view.addSubview(stackView)
        stackView.anchor(top: questionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)
    }
    
    // MARK:- Exit View
    func presentBackConfirmationsView() {
        backButton.isEnabled = false
        view.addSubview(exitConfirmationView)
        exitConfirmationView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: 0)
        
        exitConfirmationView.addSubview(exitConfirmationLabel)
        exitConfirmationLabel.anchor(top: exitConfirmationView.topAnchor, left: exitConfirmationView.leftAnchor, bottom: nil, right: exitConfirmationView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        setupExitStackView()
        
        UIView.animate(withDuration: 0.5) {
            self.exitConfirmationView.alpha = 0.95
        }
    }
    
    // MARK:- Exit StackView
    var exitStackView = UIStackView()
    func setupExitStackView() {
        exitStackView = UIStackView(arrangedSubviews: [exitGameCancel, exitGameConfirm])
        let exitStackViewWidth = UIScreen.main.bounds.size.width - 80
        exitStackView.distribution = .fillEqually
        exitStackView.axis = .horizontal
        exitStackView.spacing = 10
        
        exitConfirmationView.addSubview(exitStackView)
        exitStackView.centerXAnchor.constraint(equalTo: exitConfirmationView.centerXAnchor).isActive = true
        exitStackView.centerYAnchor.constraint(equalTo: exitConfirmationView.centerYAnchor).isActive = true
        exitStackView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: exitStackViewWidth, height: buttonHeight)
    }
    
    // MARK:- Button Actions
    @objc func backTapped() {
        presentBackConfirmationsView()
        vibrate()
    }
    
    @objc func confirmTapped() {
        self.navigationController?.popViewController(animated: true)
        resetGame()
        vibrate()
    }
    
    @objc func cancelTapped() {
        UIView.animate(withDuration: 1) {
            self.exitConfirmationView.alpha = 0
        }
        backButton.isEnabled = true
//        correctButton.isEnabled = true
//        incorrectButton.isEnabled = true
        vibrate()
    }

}

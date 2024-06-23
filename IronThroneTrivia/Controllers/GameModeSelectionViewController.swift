//
//  GameModeSelectionViewController.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 11/21/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class GameModeSelectionViewController: UIViewController {

    public var jsonString = ""
    
    private let background: UIImageView = {
        let image = UIImageView()
        image.image = backgroundImage
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = true
        button.tintColor = whiteColor
        button.setTitleColor(whiteColor, for: .normal)
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    private let inststructionLabel: UILabel = {
        let label = UILabel()
        label.font = secondaryLabelFont
        label.text = "Select a Game Type"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = whiteColor
        return label
    }()
    
    private let disclaimerLabel: UILabel = {
        let label = UILabel()
        label.text = "- TV Series Trivia -"
        label.font = secondaryLabelFont
        label.textAlignment = .center
        label.textColor = subLogoColor
        return label
    }()
    
    private lazy var classicButton: GameButton = {
        let button = GameButton(title: "Classic")
        button.addTarget(self, action: #selector(classicTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var survivalButton: GameButton = {
        let button = GameButton(title: "Survival")
        button.addTarget(self, action: #selector(survivalTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var blitzButton: GameButton = {
        let button = GameButton(title: "Blitz")
        button.addTarget(self, action: #selector(blitzTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var hangmanButton: GameButton = {
        let button = GameButton(title: "Hangman")
        button.addTarget(self, action: #selector(hangmanTapped), for: .touchUpInside)
        return button
    }()
    
// MARK: - View Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        varyForScreenSizes(screenHeight: SCREEN_HEIGHT)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
// MARK: - Setting up views
    private func setupViews() {
        view.backgroundColor = .black
        classicButton.titleLabel?.font = primaryLabelFont
        survivalButton.titleLabel?.font = primaryLabelFont
        blitzButton.titleLabel?.font = primaryLabelFont
        disclaimerLabel.font = secondaryLabelFont
        
        BUTTON_HEIGHT = SCREEN_HEIGHT / 10
        view.addSubview(background)
        background.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        let backButtonImageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
        let backButtonImage = UIImage(systemName: "chevron.left.square", withConfiguration: backButtonImageConfig)
        
        backButton.setImage(backButtonImage, for: .normal)
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(inststructionLabel)
        inststructionLabel.anchor(top: backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        setupStackView()
        
        view.addSubview(disclaimerLabel)
        disclaimerLabel.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: -10, paddingRight: 10, width: 0, height: 0)
    }
    
    private var stackView = UIStackView()
    // MARK: - Setting Up the StackView
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [classicButton, survivalButton, blitzButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        // calculating based on the number of buttons in stack view and adding 20 padding
        let stackViewHeight = CGFloat(Int(BUTTON_HEIGHT) * stackView.arrangedSubviews.count + 30)
        
        view.addSubview(stackView)
        stackView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
// MARK: - Button Actions
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
        vibrate()
    }
    
    @objc func classicTapped() {
        vibrate()
        let vc = self.storyboard?.instantiateViewController(identifier: "SelectNumberOfQuestions") as! SelectNumberOfQuestions
        vc.jsonString = jsonString
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func survivalTapped() {
        vibrate()
        //convertAllJSON(jsonToRead: jsonString)
        convertJSON(jsonToRead: jsonString)
        let vc = self.storyboard?.instantiateViewController(identifier: "SurvivalViewController") as! SurvivalViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func blitzTapped() {
        vibrate()
        convertJSON(jsonToRead: jsonString)
        let vc = self.storyboard?.instantiateViewController(identifier: "BlitzViewController") as! BlitzViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func hangmanTapped() {
        vibrate()
        let vc = self.storyboard?.instantiateViewController(identifier: "HangmanSelectionViewController") as! HangmanSelectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

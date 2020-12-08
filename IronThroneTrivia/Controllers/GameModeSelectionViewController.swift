//
//  GameModeSelectionViewController.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 11/21/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class GameModeSelectionViewController: UIViewController {

    let background: UIImageView = {
        let image = UIImageView()
        image.image = backgroundImage
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let gameLabel: UILabel = {
        let label = UILabel()
        label.text = "Iron Throne"
        label.font = gameLabelFont
        label.textAlignment = .center
        label.textColor = logoColor
        return label
    }()
    
    let subGameLabel: UILabel = {
        let label = UILabel()
        label.text = "Trivia"
        label.font = subGameLabelFont
        label.textAlignment = .center
        label.textColor = logoColor
        return label
    }()
    
    let disclaimerLabel: UILabel = {
        let label = UILabel()
        label.text = "- TV Series Trivia -"
        label.font = disclaimerLabelFont
        label.textAlignment = .center
        label.textColor = subLogoColor
        return label
    }()
    
    let classicButton: GameButton = {
        let button = GameButton(title: "Classic")
        button.addTarget(self, action: #selector(classicTapped), for: .touchUpInside)
        return button
    }()
    
    let survivalButton: GameButton = {
        let button = GameButton(title: "Survival")
        button.addTarget(self, action: #selector(survivalTapped), for: .touchUpInside)
        return button
    }()
    
    let blitzButton: GameButton = {
        let button = GameButton(title: "Blitz")
        button.addTarget(self, action: #selector(blitzTapped), for: .touchUpInside)
        return button
    }()
    
    let hangmanButton: GameButton = {
        let button = GameButton(title: "Hangman")
        button.addTarget(self, action: #selector(hangmanTapped), for: .touchUpInside)
        return button
    }()
    
    let creditsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Credits, Scores, & More", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = instructionLabelFont
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 10.0
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(creditsTapped), for: .touchUpInside)
        return button
    }()
    
// MARK:- View Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenHeight = UIScreen.main.bounds.size.height
        varyForScreenSizes(screenHeight: screenHeight)
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
// MARK:- Setting up views
    func setupViews() {
        gameLabel.font = gameLabelFont
        subGameLabel.font = subGameLabelFont
        classicButton.titleLabel?.font = buttonFont
        survivalButton.titleLabel?.font = buttonFont
        blitzButton.titleLabel?.font = buttonFont
        disclaimerLabel.font = disclaimerLabelFont
        creditsButton.titleLabel?.font = instructionLabelFont
        
        let screenHeight = UIScreen.main.bounds.size.height
        buttonHeight = screenHeight / 10
        view.addSubview(background)
        background.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(gameLabel)
        gameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
        
        view.addSubview(subGameLabel)
        subGameLabel.anchor(top: gameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        setupStackView()
        
        view.addSubview(creditsButton)
        creditsButton.anchor(top: stackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(disclaimerLabel)
        disclaimerLabel.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: -10, paddingRight: 10, width: 0, height: 0)
    }
    
    var stackView = UIStackView()
    // MARK: Setting Up the StackView
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [classicButton, survivalButton, blitzButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        // calculating based on the number of buttons in stack view and adding 20 padding
        let stackViewHeight = CGFloat(Int(buttonHeight) * stackView.arrangedSubviews.count + 30)
        
        view.addSubview(stackView)
        stackView.anchor(top: subGameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)
    }
    
// MARK:- Button Actions
    @objc func classicTapped() {
        vibrate()
        let vc = self.storyboard?.instantiateViewController(identifier: "SelectNumberOfQuestions") as! SelectNumberOfQuestions
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func survivalTapped() {
        vibrate()
        convertAllJSON(jsonToRead: "gameOfThrones")
        let vc = self.storyboard?.instantiateViewController(identifier: "SurvivalViewController") as! SurvivalViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func blitzTapped() {
        vibrate()
        convertAllJSON(jsonToRead: "gameOfThrones")
        let vc = self.storyboard?.instantiateViewController(identifier: "BlitzViewController") as! BlitzViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func hangmanTapped() {
        vibrate()
        let vc = self.storyboard?.instantiateViewController(identifier: "HangmanSelectionViewController") as! HangmanSelectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func creditsTapped() {
        vibrate()
        let vc = self.storyboard?.instantiateViewController(identifier: "CreditsViewController") as! CreditsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func scoresTapped() {
        vibrate()
        let vc = self.storyboard?.instantiateViewController(identifier: "CreditsViewController") as! CreditsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

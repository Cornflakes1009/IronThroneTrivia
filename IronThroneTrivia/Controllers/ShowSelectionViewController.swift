//
//  ShowSelectionViewController.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 2/8/23.
//  Copyright © 2023 HaroldDavidson. All rights reserved.
//

import UIKit
import StoreKit

class ShowSelectionViewController: UIViewController {

    private let background: UIImageView = {
        let image = UIImageView()
        image.image = backgroundImage
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let gameLabel: UILabel = {
        let label = UILabel()
        label.text = "Iron Throne"
        label.font = gameLabelFont
        label.textAlignment = .center
        label.textColor = logoColor
        return label
    }()
    
    private let subGameLabel: UILabel = {
        let label = UILabel()
        label.text = "Trivia"
        label.font = subGameLabelFont
        label.textAlignment = .center
        label.textColor = logoColor
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
    
    private lazy var gameOfThronesButton: GameButton = {
        let button = GameButton(title: "Game of Thrones")
        button.addTarget(self, action: #selector(gameOfThronesTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var houseOfTheDragonButton: GameButton = {
        let button = GameButton(title: "House of the Dragon")
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(houseOfTheDragonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var creditsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Scores & Support", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = secondaryLabelFont
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 10.0
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(creditsTapped), for: .touchUpInside)
        return button
    }()
    
// MARK: - View Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        varyForScreenSizes(screenHeight: SCREEN_HEIGHT)
        print("\(UIScreen.main.bounds.size.width) x \(SCREEN_HEIGHT)")
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        if completedGame && numOfGamesPlayed >= 3 {
            SKStoreReviewController.requestReview()
        }
        
        AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }

    
// MARK: - Setting up views
    private func setupViews() {
        gameLabel.font = gameLabelFont
        subGameLabel.font = subGameLabelFont
        gameOfThronesButton.titleLabel?.font = primaryLabelFont
        houseOfTheDragonButton.titleLabel?.font = primaryLabelFont
        //blitzButton.titleLabel?.font = buttonFont
        disclaimerLabel.font = secondaryLabelFont
        creditsButton.titleLabel?.font = secondaryLabelFont
        
        BUTTON_HEIGHT = SCREEN_HEIGHT / 10
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
    
    private var stackView = UIStackView()
    // MARK: - Setting Up the StackView
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [gameOfThronesButton, houseOfTheDragonButton])
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
    @objc func gameOfThronesTapped() {
        vibrate()
        let vc = self.storyboard?.instantiateViewController(identifier: "GameModeSelectionViewController") as! GameModeSelectionViewController
        vc.jsonString = "gameOfThrones"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func houseOfTheDragonTapped() {
        vibrate()
        //convertAllJSON(jsonToRead: "houseOfTheDragon")
        let vc = self.storyboard?.instantiateViewController(identifier: "GameModeSelectionViewController") as! GameModeSelectionViewController
        vc.jsonString = "houseOfTheDragon"
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

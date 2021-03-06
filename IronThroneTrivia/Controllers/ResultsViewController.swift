//
//  ResultsViewController.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 9/9/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    let background: UIImageView = {
        let image = UIImageView()
        image.image = backgroundImage
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let gameOverLabel: UILabel = {
        let label = UILabel()
        label.text = "Game Over"
        label.font = gameLabelFont
        label.textAlignment = .center
        
        label.textColor = logoColor
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "\(correctlyAnswered)/\(questionList.count)"
        label.textColor = whiteColor
        label.font = finalScoreFont
        return label
    }()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let restartButton: GameButton = {
        let button = GameButton(title: "Restart")
        button.addTarget(self, action: #selector(restartTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(background)
        background.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(gameOverLabel)
        gameOverLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
        
        view.addSubview(scoreLabel)
        scoreLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(restartButton)
        restartButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: buttonHeight)
    }
    
    @objc func restartTapped() {
        resetGame()
        self.navigationController?.popToRootViewController(animated: true)
    }

}

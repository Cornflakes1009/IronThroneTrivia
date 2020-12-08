//
//  ViewController.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 9/9/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import GoogleMobileAds
import UIKit

class SelectNumberOfQuestions: UIViewController {
    
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
        button.setTitleColor(whiteColor, for: .normal)
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    let disclaimerLabel: UILabel = {
        let label = UILabel()
        label.font = instructionLabelFont
        label.text = "Note: All trivia is from the TV series"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = whiteColor
        return label
    }()
    
    // MARK:- Banner View
    let bannerView: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = adUnitId
        banner.load(GADRequest())
        return banner
    }()
    
    // MARK:- Selection Buttons
    let fifteenButton: GameButton = {
        let button = GameButton(title: "15 Questions")
        button.addTarget(self, action: #selector(fifteenTapped), for: .touchUpInside)
        return button
    }()
    
    let twentyFiveButton: GameButton = {
        let button = GameButton(title: "25 Questions")
        button.addTarget(self, action: #selector(twentyFiveTapped), for: .touchUpInside)
        return button
    }()
    
    let fiftyButton: GameButton = {
        let button = GameButton(title: "50 Questions")
        button.addTarget(self, action: #selector(fiftyTapped), for: .touchUpInside)
        return button
    }()
    
    let oneHundredButton: GameButton = {
        let button = GameButton(title: "100 Questions")
        button.addTarget(self, action: #selector(oneHundredTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK:- Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        let screenHeight = UIScreen.main.bounds.size.height
        let fifthOfScreenHeight = screenHeight / 5
        
        view.addSubview(background)
        background.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        let backButtonImageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
        let backButtonImage = UIImage(systemName: "chevron.left.square", withConfiguration: backButtonImageConfig)
        
        backButton.setImage(backButtonImage, for: .normal)
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(disclaimerLabel)
        disclaimerLabel.anchor(top: backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: fifthOfScreenHeight)
        
        bannerView.rootViewController = self
        view.addSubview(bannerView)
        bannerView.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -20, paddingRight: 0, width: 281, height: 50)
        bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setupStackView()
    }
    
    var stackView = UIStackView()
    // MARK: Setting Up the StackView
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [fifteenButton, twentyFiveButton, fiftyButton, oneHundredButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        let screenHeight = UIScreen.main.bounds.size.height
        let stackViewHeight = CGFloat(screenHeight / 2)
        stackViewButtonHeight = CGFloat((stackViewHeight - 40) / 5)
        
        view.addSubview(stackView)
        stackView.anchor(top: nil, left: view.leftAnchor, bottom: bannerView.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -30, paddingRight: 20, width: 0, height: stackViewHeight)
    }
    
    // MARK:- Button Actions
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
        vibrate()
    }
    
    @objc func fifteenTapped() {
        convertJSON(jsonToRead: "gameOfThrones", numberOfQuestions: 15)
        let vc = self.storyboard?.instantiateViewController(identifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }
    
    @objc func twentyFiveTapped() {
        convertJSON(jsonToRead: "gameOfThrones", numberOfQuestions: 25)
        let vc = self.storyboard?.instantiateViewController(identifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }
    
    @objc func fiftyTapped() {
        convertJSON(jsonToRead: "gameOfThrones", numberOfQuestions: 50)
        let vc = self.storyboard?.instantiateViewController(identifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }
    
    @objc func oneHundredTapped() {
        convertJSON(jsonToRead: "gameOfThrones", numberOfQuestions: 100)
        let vc = self.storyboard?.instantiateViewController(identifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        vibrate()
    }
}

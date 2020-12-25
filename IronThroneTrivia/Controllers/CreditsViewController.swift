//
//  CreditsViewController.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 11/27/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit
import MessageUI

class CreditsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    let screenHeight = UIScreen.main.bounds.size.height
    let percentageAnsweredCorrectly = round(Double(historicAnswered) / Double(historicQuestions) * 100)
    
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
        button.tintColor = whiteColor
        button.setTitleColor(whiteColor, for: .normal)
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    let scoresTitleLabel: UILabel = {
        let label = UILabel()
        label.font = subGameLabelFont
        label.textAlignment = .center
        label.textColor = whiteColor
        label.text = "Scores"
        return label
    }()
    
    let totalNumberOfQuestionsLabel: UILabel = {
        let label = UILabel()
        label.font = instructionLabelFont
        label.textColor = whiteColor
        label.text = "Questions Answered: \(historicQuestions)"
        return label
    }()
    
    let totalNumberCorrectLabel: UILabel = {
        let label = UILabel()
        label.font = instructionLabelFont
        label.textColor = whiteColor
        label.text = "Correctly Answered: \(historicAnswered)"
        return label
    }()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.font = instructionLabelFont
        label.textColor = whiteColor
        return label
    }()
    
    let numOfGamesPlayedLabel: UILabel = {
        let label = UILabel()
        label.font = instructionLabelFont
        label.textColor = whiteColor
        label.text = "Games Played: \(numOfGamesPlayed)"
        return label
    }()
    
    let creditsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = subGameLabelFont
        label.textAlignment = .center
        label.textColor = whiteColor
        label.text = "Credits"
        return label
    }()
    let creditsTextView: UITextView = {
        let tv = UITextView()
        tv.text = """
        I'd like to give a special thanks to my girlfriend, Cheng for making the app icon.
        """
        tv.textColor = .white
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = true
        tv.font = instructionLabelFont
        return tv
    }()
    
    let emailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Email", for: .normal)
        button.addTarget(self, action: #selector(emailTapped), for: .touchUpInside)
        button.setTitleColor(whiteColor, for: .normal)
        button.titleLabel?.font = instructionLabelFont
        return button
    }()
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    // MARK:- Setup Views
    func setupViews() {
        view.addSubview(background)
        background.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        let backButtonImageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
        let backButtonImage = UIImage(systemName: "chevron.left.square", withConfiguration: backButtonImageConfig)
        
        backButton.setImage(backButtonImage, for: .normal)
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(scoresTitleLabel)
        scoresTitleLabel.anchor(top: backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        setupStackView()
        
        view.addSubview(creditsTitleLabel)
        creditsTitleLabel.anchor(top: stackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        let creditsViewHeight = screenHeight * 0.2
        view.addSubview(creditsTextView)
        creditsTextView.anchor(top: creditsTitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: creditsViewHeight)
        
        view.addSubview(emailButton)
        emailButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: 0)
    }
    
    // MARK:- StackView
    var stackView = UIStackView()
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [totalNumberCorrectLabel, totalNumberOfQuestionsLabel, numOfGamesPlayedLabel, percentageLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        let stackViewHeight = screenHeight * 0.3
        
        if percentageAnsweredCorrectly.isNaN {
            percentageLabel.text = "Percent Correct: N/A"
        } else {
            percentageLabel.text = "Percent Correct: \(percentageAnsweredCorrectly)%"
        }
        
        view.addSubview(stackView)
        stackView.anchor(top: scoresTitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)
    }
    
    // MARK:- Email Functions
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["spelldevelopment@gmail.com"])
            mail.setMessageBody("<p>Hello, Spell Development. I have a question, issue, or general inquiry.</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    // MARK:- Button Actions
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
        vibrate()
    }
    
    @objc func emailTapped() {
        vibrate()
        sendEmail()
    }
}

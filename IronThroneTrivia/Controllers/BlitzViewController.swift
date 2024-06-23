//
//  BlitzViewController.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 11/27/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import GoogleMobileAds
import UIKit

class BlitzViewController: UIViewController, GADFullScreenContentDelegate {
    
    private var timer = Timer()
    private var time: Double = 120
    private var interstitial: GADInterstitialAd?
    private var rewardedAd: GADRewardedAd?
    
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
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = secondaryLabelFont
        label.textAlignment = .center
        label.textColor = whiteColor
        label.numberOfLines = 0
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "120.0"
        label.font = secondaryLabelFont
        label.textAlignment = .center
        label.textColor = whiteColor
        return label
    }()
    
    private let questionNumberLabel: UILabel = {
        let label = UILabel()
        label.font = secondaryLabelFont
        label.textAlignment = .center
        label.textColor = whiteColor
        return label
    }()
    
    private let popUpBackground: UIImageView = {
        let image = UIImageView()
        image.image = popUpBackgroundImage
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.alpha = 0.3
        return image
    }()
    
    // MARK:- Banner View
    private let bannerView: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = adUnitId
        banner.load(GADRequest())
        return banner
    }()
    
    // MARK: - Answer Buttons
    private lazy var optionZeroButton: GameButton = {
        let button = GameButton(title: "Sacrifice to the Lord of the Light")
        button.titleLabel?.font = answerButtonFont
        button.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var optionOneButton: GameButton = {
        let button = GameButton(title: "")
        button.titleLabel?.font = answerButtonFont
        button.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var optionTwoButton: GameButton = {
        let button = GameButton(title: "")
        button.titleLabel?.font = answerButtonFont
        button.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var optionThreeButton: GameButton = {
        let button = GameButton(title: "")
        button.titleLabel?.font = answerButtonFont
        button.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Ready View
    private let explanationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.alpha = 0
        view.isOpaque = true
        return view
    }()
    
    private let explanationTopLabel: UILabel = {
        let label = UILabel()
        label.text = "Answer as many questions as you can before the time's up. No penalty for wrong answers."
        label.font = secondaryLabelFont
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var readyButton: GameButton = {
        let button = GameButton(title: "Ready?")
        button.addTarget(self, action: #selector(readyTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Correct Answer View
    private let correctAnswerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.alpha = 0
        view.isOpaque = true
        return view
    }()
    
    private let correctAnswerTopLabel: UILabel = {
        let label = UILabel()
        label.text = "Sorry, the correct answer was:"
        label.font = secondaryLabelFont
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let correctAnswerLabel: UILabel = {
        let label = UILabel()
        label.text = "\(questionList[questionIndex].answer)"
        label.font = secondaryLabelFont
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var nextQuestionButton: GameButton = {
        let button = GameButton(title: "Next Question")
        button.addTarget(self, action: #selector(nextQuestionTapped), for: .touchUpInside)
        button.titleLabel?.font = nextQuestionFont
        return button
    }()
    
    private lazy var extraLifeButton: GameButton = {
        let button = GameButton(title: "Extra Life?")
        button.addTarget(self, action: #selector(extraLifeTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var extraLifeExitButton: UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = true
        button.tintColor = whiteColor
        button.setTitleColor(whiteColor, for: .normal)
        button.addTarget(self, action: #selector(extraLifeExitTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Exit Confirmation
    private let exitConfirmationView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.alpha = 0
        view.isOpaque = true
        return view
    }()
    
    private let exitConfirmationLabel: UILabel = {
        let label = UILabel()
        label.text = "Are you sure you wish to exit? This will exit the game and you'll lose your current progress"
        label.font = secondaryLabelFont
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var exitGameCancel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(whiteColor, for: .normal)
        button.titleLabel?.font = canceViewButtonFont
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.borderColor = whiteColor.cgColor
        button.titleLabel?.layer.shadowRadius = 0.5
        button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var exitGameConfirm: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Exit", for: .normal)
        button.setTitleColor(whiteColor, for: .normal)
        button.titleLabel?.font = canceViewButtonFont
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1).cgColor
        button.titleLabel?.layer.shadowRadius = 0.5
        button.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        numOfGamesPlayed += 1
        defaults.setValue(numOfGamesPlayed, forKey: "numOfGamesPlayed")
        
        setupBannerView()
        Task {
            await loadInterstitial()
            await loadRewardedAd()
        }
        
        // handling the app moving to the background and foreground
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appMovedToBackground() {
        if time < 121 {
            timer.invalidate()
        }
    }
    
    @objc func appMovedToForeground() {
        if time < 120 {
            startTimer()
        }
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubview(background)
        background.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        backButton.setImage(backButtonImage, for: .normal)
        view.addSubview(backButton)
        backButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(timerLabel)
        timerLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(questionNumberLabel)
        questionNumberLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
        
        view.addSubview(questionLabel)
        questionLabel.anchor(top: backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        bannerView.rootViewController = self
        view.addSubview(bannerView)
        bannerView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -20, paddingRight: 0, width: 0, height: 50)
        bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setupStackView()
        updateUI()
        addExplanationView()
    }
    
    // MARK: - StackView
    private var stackView = UIStackView()
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [optionZeroButton, optionOneButton, optionTwoButton, optionThreeButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        // calculating based on the number of buttons in stack view and adding 20 padding
        let stackViewHeight = CGFloat(Int(BUTTON_HEIGHT) * stackView.arrangedSubviews.count + 40)
        
        view.addSubview(stackView)
        stackView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: stackViewHeight)
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    // MARK: - Explanation View
    private func addExplanationView() {
        backButton.isEnabled = false
        view.addSubview(explanationView)
        explanationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: -10, paddingRight: 10, width: 0, height: 0)
        UIView.animate(withDuration: 1) {
            self.explanationView.alpha = 1
        }
        
        explanationView.addSubview(explanationTopLabel)
        explanationTopLabel.anchor(top: explanationView.topAnchor, left: explanationView.leftAnchor, bottom: nil, right: explanationView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        explanationView.addSubview(popUpBackground)
        popUpBackground.anchor(top: explanationView.topAnchor, left: explanationView.leftAnchor, bottom: explanationView.bottomAnchor, right: explanationView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        popUpBackground.centerXAnchor.constraint(equalTo: explanationView.centerXAnchor).isActive = true
        popUpBackground.centerYAnchor.constraint(equalTo: explanationView.centerYAnchor).isActive = true
        
        explanationView.addSubview(readyButton)
        readyButton.anchor(top: nil, left: explanationView.leftAnchor, bottom: explanationView.bottomAnchor, right: explanationView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: BUTTON_HEIGHT)
    }
    
    // MARK: - Exit View
    private func presentBackConfirmationsView() {
        backButton.isEnabled = false
        view.addSubview(exitConfirmationView)
        exitConfirmationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: -10, paddingRight: 10, width: 0, height: 0)
        
        exitConfirmationView.addSubview(popUpBackground)
        popUpBackground.anchor(top: exitConfirmationView.topAnchor, left: exitConfirmationView.leftAnchor, bottom: exitConfirmationView.bottomAnchor, right: exitConfirmationView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        popUpBackground.centerXAnchor.constraint(equalTo: exitConfirmationView.centerXAnchor).isActive = true
        popUpBackground.centerYAnchor.constraint(equalTo: exitConfirmationView.centerYAnchor).isActive = true
        
        exitConfirmationView.addSubview(exitConfirmationLabel)
        exitConfirmationLabel.anchor(top: exitConfirmationView.topAnchor, left: exitConfirmationView.leftAnchor, bottom: nil, right: exitConfirmationView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        setupExitStackView()
        
        UIView.animate(withDuration: 0.5) {
            self.exitConfirmationView.alpha = popUpViewAlpha
        }
    }
    
    // MARK: - Exit StackView
    private var exitStackView = UIStackView()
    private func setupExitStackView() {
        exitStackView = UIStackView(arrangedSubviews: [exitGameCancel, exitGameConfirm])
        let exitStackViewWidth = UIScreen.main.bounds.size.width - 80
        exitStackView.distribution = .fillEqually
        exitStackView.axis = .horizontal
        exitStackView.spacing = 10
        
        exitConfirmationView.addSubview(exitStackView)
        exitStackView.centerXAnchor.constraint(equalTo: exitConfirmationView.centerXAnchor).isActive = true
        exitStackView.centerYAnchor.constraint(equalTo: exitConfirmationView.centerYAnchor).isActive = true
        exitStackView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: exitStackViewWidth, height: BUTTON_HEIGHT)
    }
    
    private func updateUI() {
        questionLabel.text = "\(questionList[questionIndex].question)"
        optionZeroButton.setTitle(questionList[questionIndex].optionZero, for: .normal)
        optionOneButton.setTitle(questionList[questionIndex].optionOne, for: .normal)
        optionTwoButton.setTitle(questionList[questionIndex].optionTwo, for: .normal)
        optionThreeButton.setTitle(questionList[questionIndex].optionThree, for: .normal)
        
        questionNumberLabel.text = "\(questionIndex + 1)/\(questionList.count)"
    }
    
    // MARK: - Show Rewarded Ad Answer View
    private func showRewardedAdAnswerView() {
        nextQuestionButton.removeFromSuperview()
        backButton.isEnabled = false
        view.addSubview(correctAnswerView)
        correctAnswerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: -10, paddingRight: 10, width: 0, height: 0)
        UIView.animate(withDuration: 0.5) {
            self.correctAnswerView.alpha = popUpViewAlpha
        }
        
        let backButtonImageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
        let backButtonImage = UIImage(systemName: closePopupSymbol, withConfiguration: backButtonImageConfig)
        
        extraLifeExitButton.setImage(backButtonImage, for: .normal)
        correctAnswerView.addSubview(extraLifeExitButton)
        extraLifeExitButton.anchor(top: correctAnswerView.topAnchor, left: correctAnswerView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
//        let currentCorrectAnswer = questionList[questionIndex].answer
//        if currentCorrectAnswer == 0 {
//            correctAnswerLabel.text = "\(questionList[questionIndex].optionZero)"
//        } else if currentCorrectAnswer == 1 {
//            correctAnswerLabel.text = "\(questionList[questionIndex].optionOne)"
//        } else if currentCorrectAnswer == 2 {
//            correctAnswerLabel.text = "\(questionList[questionIndex].optionTwo)"
//        } else {
//            correctAnswerLabel.text = "\(questionList[questionIndex].optionThree)"
//        }
        
        correctAnswerLabel.text = questionList[questionIndex].answer
        
        correctAnswerView.addSubview(popUpBackground)
        popUpBackground.anchor(top: correctAnswerView.topAnchor, left: correctAnswerView.leftAnchor, bottom: correctAnswerView.bottomAnchor, right: correctAnswerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        popUpBackground.centerXAnchor.constraint(equalTo: correctAnswerView.centerXAnchor).isActive = true
        popUpBackground.centerYAnchor.constraint(equalTo: correctAnswerView.centerYAnchor).isActive = true
        
        correctAnswerView.addSubview(correctAnswerTopLabel)
        correctAnswerTopLabel.anchor(top: extraLifeExitButton.bottomAnchor, left: correctAnswerView.leftAnchor, bottom: nil, right: correctAnswerView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        correctAnswerView.addSubview(correctAnswerLabel)
        correctAnswerLabel.anchor(top: nil, left: correctAnswerView.leftAnchor, bottom: nil, right: correctAnswerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        correctAnswerLabel.centerXAnchor.constraint(equalTo: correctAnswerView.centerXAnchor).isActive = true
        correctAnswerLabel.centerYAnchor.constraint(equalTo: correctAnswerView.centerYAnchor).isActive = true
        
        correctAnswerView.addSubview(extraLifeButton)
        extraLifeButton.anchor(top: nil, left: correctAnswerView.leftAnchor, bottom: correctAnswerView.bottomAnchor, right: correctAnswerView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: BUTTON_HEIGHT)
    }
    
    // MARK: - Show Correct Answer View
    private func showCorrectAnswer() {
        extraLifeButton.removeFromSuperview()
        backButton.isEnabled = false
        view.addSubview(correctAnswerView)
        correctAnswerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: -10, paddingRight: 10, width: 0, height: 0)
        UIView.animate(withDuration: 0.5) {
            self.correctAnswerView.alpha = popUpViewAlpha
        }
        
//        let currentCorrectAnswer = questionList[questionIndex].answer
//        if currentCorrectAnswer == 0 {
//            correctAnswerLabel.text = "\(questionList[questionIndex].optionZero)"
//        } else if currentCorrectAnswer == 1 {
//            correctAnswerLabel.text = "\(questionList[questionIndex].optionOne)"
//        } else if currentCorrectAnswer == 2 {
//            correctAnswerLabel.text = "\(questionList[questionIndex].optionTwo)"
//        } else {
//            correctAnswerLabel.text = "\(questionList[questionIndex].optionThree)"
//        }
        
        correctAnswerLabel.text = questionList[questionIndex].answer
        
        correctAnswerView.addSubview(popUpBackground)
        popUpBackground.anchor(top: correctAnswerView.topAnchor, left: correctAnswerView.leftAnchor, bottom: correctAnswerView.bottomAnchor, right: correctAnswerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        popUpBackground.centerXAnchor.constraint(equalTo: correctAnswerView.centerXAnchor).isActive = true
        popUpBackground.centerYAnchor.constraint(equalTo: correctAnswerView.centerYAnchor).isActive = true
        
        correctAnswerView.addSubview(correctAnswerTopLabel)
        correctAnswerTopLabel.anchor(top: correctAnswerView.topAnchor, left: correctAnswerView.leftAnchor, bottom: nil, right: correctAnswerView.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        correctAnswerView.addSubview(correctAnswerLabel)
        correctAnswerLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        correctAnswerLabel.centerXAnchor.constraint(equalTo: correctAnswerView.centerXAnchor).isActive = true
        correctAnswerLabel.centerYAnchor.constraint(equalTo: correctAnswerView.centerYAnchor).isActive = true
        
        correctAnswerView.addSubview(nextQuestionButton)
        nextQuestionButton.anchor(top: nil, left: correctAnswerView.leftAnchor, bottom: correctAnswerView.bottomAnchor, right: correctAnswerView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: BUTTON_HEIGHT)
    }
    
    // MARK: - AdMob Functions
//    private func createAd() -> GADInterstitialAd {
//        let inter = GADInterstitialAd(adUnitID: interstitialAdUnitID)
//        inter.delegate = self
//        inter.load(GADRequest())
//        return inter
//    }
//    
//    private func createAndLoadRewardedAd() {
//        rewardedAd = GADRewardedAd(adUnitID: rewardedAdUnitID)
//        rewardedAd?.load(GADRequest()) { error in
//            if let error = error {
//                print("Loading failed: \(error)")
//            } else {
//                print("Loading Succeeded")
//            }
//        }
//    }
    
    // MARK: - AdMob
    fileprivate func setupBannerView() {
        // starting ads on the bannerview
        bannerView.adUnitID = adUnitId
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    fileprivate func loadInterstitial() async {
        do {
            interstitial = try await GADInterstitialAd.load(
                withAdUnitID: interstitialAdUnitID, request: GADRequest())
        } catch {
            print("Failed to load interstitial ad with error: \(error.localizedDescription)")
        }
    }
    
    func showInterstitial() async {
        guard let interstitial = interstitial else {
            return print("Ad wasn't ready.")
        }
        // The UIViewController parameter is an optional.
        interstitial.present(fromRootViewController: nil)
    }
    
    func loadRewardedAd() async {
        do {
            rewardedAd = try await GADRewardedAd.load(
                withAdUnitID: rewardedAdUnitID, request: GADRequest())
            rewardedAd?.fullScreenContentDelegate = self
        } catch {
            print("Rewarded ad failed to load with error: \(error.localizedDescription)")
        }
    }
    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        timer.invalidate()
        UIView.animate(withDuration: 1) {
            self.correctAnswerView.alpha = 0
        }
        time = 30
        startTimer()
        Task {
            await loadRewardedAd()
        }
    }
    
    func showRewardedAd() {
        guard let rewardedAd = rewardedAd else {
            return print("Ad wasn't ready.")
        }
        
        // The UIViewController parameter is an optional.
        rewardedAd.present(fromRootViewController: nil) {
            let reward = rewardedAd.adReward
            print("Reward received with currency \(reward.amount), amount \(reward.amount.doubleValue)")
        }
    }
    
    // MARK: - Check if Answer Tapped is Correct
    private func checkIfCorrect(buttonTextValue: String) {
        historicQuestions += 1
        defaults.setValue(historicQuestions, forKey: "totalNumberOfQuestions")
        if buttonTextValue == questionList[questionIndex].answer {
            historicAnswered += 1
            defaults.setValue(historicAnswered, forKey: "totalNumberOfCorrect")
            correctlyAnswered += 1
        } else {
            showCorrectAnswer()
        }
        
        if questionIndex + 1 != questionList.count {
            questionIndex += 1
            updateUI()
        } else {
            Task {
                await showInterstitial()
            }
            
            let vc = self.storyboard?.instantiateViewController(identifier: "BlitzResultsViewController") as! BlitzResultsViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Timer
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(SurvivalViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        time -= 0.1
        // rounding to the tenths. example: 8.1
        time = Double(round(10 * time) / 10)
        timerLabel.text = "\(String(describing: time))"
        if(time == 0) {
            timer.invalidate()
            showRewardedAdAnswerView()
        }
    }
    
    // MARK: - Button Actions
    @objc func readyTapped() {
        // starting the game timer
        startTimer()
        UIView.animate(withDuration: 1) {
            self.explanationView.alpha = 0
        }
        backButton.isEnabled = true
    }
    
    @objc func backTapped() {
        presentBackConfirmationsView()
        vibrate()
    }
    
    @objc func answerTapped(_ sender: UIButton!) {
        // check if selected button has correct answer, if not, present a view with correct answer
//        if sender == optionZeroButton {
//            checkIfCorrect(buttonTextValue: 0)
//        } else if sender == optionOneButton {
//            checkIfCorrect(buttonTextValue: 1)
//        } else if sender == optionTwoButton {
//            checkIfCorrect(buttonTextValue: 2)
//        } else if sender == optionThreeButton {
//            checkIfCorrect(buttonTextValue: 3)
//        }
        
        checkIfCorrect(buttonTextValue: sender.titleLabel?.text ?? "")
        vibrate()
    }
    
    @objc func extraLifeTapped() {
        timer.invalidate()
        time = 30
        showRewardedAd()
    }
    
    @objc func extraLifeExitTapped() {
        timer.invalidate()
        
        showRewardedAd()
        
        let vc = self.storyboard?.instantiateViewController(identifier: "BlitzResultsViewController") as! BlitzResultsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func confirmTapped() {
        timer.invalidate()
        self.navigationController?.popViewController(animated: true)
        resetGame()
        vibrate()
    }
    
    @objc func cancelTapped() {
        UIView.animate(withDuration: 1) {
            self.exitConfirmationView.alpha = 0
        }
        backButton.isEnabled = true
        vibrate()
    }
    
    @objc func nextQuestionTapped() {
        UIView.animate(withDuration: 1) {
            self.correctAnswerView.alpha = 0
        }
        backButton.isEnabled = true
    }
}

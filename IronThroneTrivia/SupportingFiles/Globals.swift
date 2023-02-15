//
//  Globals.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 9/9/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import AVFoundation
import UIKit

// MARK: - User Defaults
let defaults                =   UserDefaults.standard
var historicQuestions       =   defaults.integer(forKey: "totalNumberOfQuestions")
var historicAnswered        =   defaults.integer(forKey: "totalNumberOfCorrect")
var numOfGamesPlayed        =   defaults.integer(forKey: "numOfGamesPlayed")

// MARK: - Fonts
let cinzel                  =   "cinzel"
let gameOfThrones           =   "Game of Thrones"
var gameLabelFont           =   UIFont(name: gameOfThrones, size: 35)
var subGameLabelFont        =   UIFont(name: gameOfThrones, size: 25)
var primaryLabelFont        =   UIFont(name: cinzel, size: 26)
var secondaryLabelFont      =   UIFont(name: cinzel, size: 15)
var canceViewButtonFont     =   UIFont(name: cinzel, size: 25)
var subCategoryButtonFont   =   UIFont(name: cinzel, size: 17)
var answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 21)
var finalScoreFont          =   UIFont(name: cinzel, size: 80)
var nextQuestionFont        =   UIFont(name: cinzel, size: 32)

// MARK: - Colors
let subLogoColor            =   UIColor.rgb(red: 222, green: 222, blue: 222, alpha: 1)
let logoColor               =   UIColor.rgb(red: 225, green: 225, blue: 225, alpha: 1)
let exitColor               =   UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1)
let cancelColor             =   UIColor.rgb(red: 0, green: 255, blue: 0, alpha: 1)
let whiteColor              =   UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1)

// MARK: - Images
let backgroundImage         =   UIImage(named: "background_image")
let popUpBackgroundImage    =   UIImage(named: "direwolf")
let backButtonImageConfig   =   UIImage.SymbolConfiguration(pointSize: 25, weight: .light, scale: .large)
let backButtonImage         =   UIImage(systemName: "chevron.left.square", withConfiguration: backButtonImageConfig)
let closePopupSymbol        =   "xmark.square"

// MARK: - Miscellaneous
var SCREEN_HEIGHT           =   CGFloat(0)
var BUTTON_HEIGHT           =   CGFloat(0)
let popUpViewAlpha          =   CGFloat(1)
var completedGame           =   false

// MARK: - Question Variables
var questionList            =   [Question]()
var questionIndex           =   0
var correctlyAnswered       =   0

// MARK: - Admobs
// PROD
//let appId                   =   "ca-app-pub-6504174477930496~3172392437"
let adUnitId                =   "ca-app-pub-6504174477930496/4924457806"
let interstitialAdUnitID    =   "ca-app-pub-6504174477930496/3312967006"
let rewardedAdUnitID        =   "ca-app-pub-6504174477930496/1456782244"

// TEST
//let adUnitId                =   "ca-app-pub-3940256099942544/2934735716"
//let interstitialAdUnitID    =   "ca-app-pub-3940256099942544/4411468910"
//let rewardedAdUnitID        =   "ca-app-pub-3940256099942544/1712485313"

// SCREENSHOT
//let adUnitId                =   ""
//let interstitialAdUnitID    =   ""
//let rewardedAdUnitID        =   ""

// MARK: - Reset Game
public func resetGame() {
    questionList = []
    questionIndex = 0
    correctlyAnswered = 0
}


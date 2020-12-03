//
//  Globals.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 9/9/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import AVFoundation
import UIKit

var stackViewButtonHeight   =   CGFloat(0)
var instructionLabelFont    =   UIFont(name: "cinzel", size: 20)
var disclaimerLabelFont     =   UIFont(name: "cinzel", size: 20)
let whiteColor              =   UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1)
var buttonFont              =   UIFont(name: "cinzel", size: 35)
let subLogoColor            =   UIColor.rgb(red: 222, green: 222, blue: 222, alpha: 1)
let logoColor               =   UIColor.rgb(red: 225, green: 225, blue: 225, alpha: 1)
let exitColor               =   UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1)
let cancelColor             =   UIColor.rgb(red: 0, green: 255, blue: 0, alpha: 1)
let backgroundImage         =   UIImage(named: "game_of_thrones_background")
let popUpBackgroundImage    =   UIImage(named: "direwolf")
let backButtonSymbol        =   "chevron.left.square"
let closePopupSymbol        =   "xmark.square"
var buttonHeight            =   CGFloat(0)
let popUpViewAlpha          =   CGFloat(1)
var canceViewButtonFont     =   UIFont(name: "cinzel", size: 25)
var categoryFont            =   UIFont(name: "cinzel", size: 35)
var subCategoryButtonFont   =   UIFont(name: "cinzel", size: 17)
var answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 21)
var finalScoreFont          =   UIFont(name: "cinzel", size: 80)
var nextQuestionFont        =   UIFont(name: "cinzel", size: 32)
var questionList            =   [Question]()
var allQuestionList         =   [Question]()
var questionIndex           =   0
var correctlyAnswered       =   0
let appId                   =   "ca-app-pub-6504174477930496~3172392437"
// Test Banner
let adUnitId                =   "ca-app-pub-3940256099942544/2934735716"
// Prod Banner
//let adUnitId                =   "ca-app-pub-6504174477930496/4924457806"
// Prod Interstitial
let interstitialAdUnitID    = "ca-app-pub-6504174477930496/3312967006"
// Prod Rewarded
//let rewardedAdUnitID        = "ca-app-pub-6504174477930496/1456782244"
// Test Rewarded
let rewardedAdUnitID        = "ca-app-pub-3940256099942544/1712485313"

func resetGame() {
    questionList = []
    allQuestionList = []
    questionIndex = 0
    correctlyAnswered = 0
}

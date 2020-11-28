////
////  exit_game_views.swift
////  IronThroneTrivia
////
////  Created by HaroldDavidson on 11/25/20.
////  Copyright © 2020 HaroldDavidson. All rights reserved.
////
//
//import UIKit
//
//
// MARK:- Exit Confirmation
//let exitConfirmationView: UIView = {
//    let view = UIView()
//    view.backgroundColor = .black
//    view.layer.cornerRadius = 10
//    view.alpha = 0
//    view.isOpaque = true
//    return view
//}()
//
//let exitConfirmationLabel: UILabel = {
//    let label = UILabel()
//    label.text = "Are you sure you wish to exit? This will exit the game and you'll lose your current progress"
//    label.font = instructionLabelFont
//    label.numberOfLines = 0
//    label.textAlignment = .center
//    label.textColor = .white
//    return label
//}()
//
//let exitGameCancel: UIButton = {
//    let button = UIButton(type: .system)
//    button.setTitle("Cancel", for: .normal)
//    button.setTitleColor(UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1), for: .normal)
//    button.titleLabel?.font = canceViewButtonFont
//    button.layer.borderWidth = 2
//    button.layer.cornerRadius = 5
//    button.layer.borderColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1).cgColor
//    button.titleLabel?.layer.shadowRadius = 0.5
//    button.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
//    return button
//}()
//
//let exitGameConfirm: UIButton = {
//    let button = UIButton(type: .system)
//    button.setTitle("Exit", for: .normal)
//    button.setTitleColor(UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1), for: .normal)
//    button.titleLabel?.font = canceViewButtonFont
//    button.layer.borderWidth = 2
//    button.layer.cornerRadius = 5
//    button.layer.borderColor = UIColor.rgb(red: 255, green: 0, blue: 0, alpha: 1).cgColor
//    button.titleLabel?.layer.shadowRadius = 0.5
//    button.addTarget(self, action: #selector(confirmTapped), for: .touchUpInside)
//    return button
//}()
//
//

// MARK:- Exit StackView
//var exitStackView = UIStackView()
//func setupExitStackView() {
//    exitStackView = UIStackView(arrangedSubviews: [exitGameCancel, exitGameConfirm])
//    let exitStackViewWidth = UIScreen.main.bounds.size.width - 80
//    exitStackView.distribution = .fillEqually
//    exitStackView.axis = .horizontal
//    exitStackView.spacing = 10
//
//    exitConfirmationView.addSubview(exitStackView)
//    exitStackView.centerXAnchor.constraint(equalTo: exitConfirmationView.centerXAnchor).isActive = true
//    exitStackView.centerYAnchor.constraint(equalTo: exitConfirmationView.centerYAnchor).isActive = true
//    exitStackView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: exitStackViewWidth, height: buttonHeight)
//}

// MARK:- Exit View
//func presentBackConfirmationsView() {
//    backButton.isEnabled = false
//    view.addSubview(exitConfirmationView)
//    exitConfirmationView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: -20, paddingRight: 20, width: 0, height: 0)
//
//    exitConfirmationView.addSubview(exitConfirmationLabel)
//    exitConfirmationLabel.anchor(top: exitConfirmationView.topAnchor, left: exitConfirmationView.leftAnchor, bottom: nil, right: exitConfirmationView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
//
//    setupExitStackView()
//
//    UIView.animate(withDuration: 0.5) {
//        self.exitConfirmationView.alpha = 0.95
//    }
//}
//
//// MARK:- Button Functions
//@objc func confirmTapped() {
//    self.navigationController?.popViewController(animated: true)
//    resetGame()
//    vibrate()
//}
//
//@objc func cancelTapped() {
//    UIView.animate(withDuration: 1) {
//        self.exitConfirmationView.alpha = 0
//    }
//    backButton.isEnabled = true
////        correctButton.isEnabled = true
////        incorrectButton.isEnabled = true
//    vibrate()
//}


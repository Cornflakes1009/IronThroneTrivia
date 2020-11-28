//
//  GameButton.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 11/21/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class GameButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        alpha = 0.8
        setTitle(title, for: .normal)
        //backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.01)
        setTitleColor(UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.01), for: .normal)
        layer.cornerRadius = 5
        layer.borderWidth = 2
        layer.borderColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.01).cgColor
        titleLabel?.font = buttonFont
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.95).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 1
        titleLabel?.layer.shadowOffset = CGSize(width: 2, height: 1)
        titleLabel?.layer.masksToBounds = false
        setTitleShadowColor(UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1), for: .normal)
        titleLabel?.layer.shadowRadius = 0.5
        titleLabel?.layer.shadowOpacity = 1.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        titleLabel?.alpha = 0.2
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        titleLabel?.alpha = 1
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        titleLabel?.alpha = 1
        vibrate()
    }
}

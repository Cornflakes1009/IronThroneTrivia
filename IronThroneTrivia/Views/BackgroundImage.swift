//
//  BackgroundImage.swift
//  IronThroneTrivia
//
//  Created by HaroldDavidson on 11/22/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class BackgroundImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        image = backgroundImage
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

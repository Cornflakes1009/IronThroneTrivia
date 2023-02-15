import UIKit


// MARK: Screen Sizes - h x w
/*
 
 https://developer.apple.com/library/archive/documentation/DeviceInformation/Reference/iOSDeviceCompatibility/Displays/Displays.html
 
 iPhones
 14 Pro Max                       =       932 x 430
 12 Pro Max, 14+, 13 Pro Max      =       926 x 428
 11 Pro Max, 11, Xs Max, XR       =       896 x 414
 14 Pro                           =       852 x 393
 12, 12 Pro, 13, 14               =       844 x 390
 11 Pro, Xs, X, 12m, 13m          =       812 x 375
 8+, 7+                           =       736 x 414
 8, 7, 6s, 6s+, 6+, 6, SE2        =       667 x 375
 SE, Touch 7                      =       568 x 320


 iPads
 12.9" Pro 1-2                    =       1366 x 1024
 10.5" Pro, Air 3                 =       1112 x 834
 9.7" Pro, Air 2, Mini 5          =       1024 x 768
*/

enum Devices: CGFloat {
    case fourteenProMaxHeight       =     932
    case twelveProMaxHeight         =     926
    case elevenAndProMaxHeight      =     896
    case fourteenProHeight          =     852
    case twelveHeight               =     844
    case elevenProHeight            =     812
    case eightPlusHeight            =     736
    case eightHeight                =     667
    case sEHeight                   =     568
    case bigiPadProHeight           =     1366
    case airThreeHeight             =     1112
    case airTwoHeight               =     1024
}

public func varyForScreenSizes(screenHeight: CGFloat) {
    switch screenHeight {
    case Devices.fourteenProMaxHeight.rawValue:
        gameLabelFont           =   UIFont(name: "Game of Thrones", size: 45)
        primaryLabelFont        =   UIFont(name: "cinzel", size: 40)
        secondaryLabelFont      =   UIFont(name: "cinzel", size: 22)
        subGameLabelFont        =   UIFont(name: "Game of Thrones", size: 40)
        answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 30)
        canceViewButtonFont     =   UIFont(name: "cinzel", size: 40)
        finalScoreFont          =   UIFont(name: "cinzel", size: 105)
        break
    case Devices.twelveProMaxHeight.rawValue:
        gameLabelFont           =   UIFont(name: "Game of Thrones", size: 45)
        primaryLabelFont        =   UIFont(name: "cinzel", size: 40)
        secondaryLabelFont      =   UIFont(name: "cinzel", size: 22)
        subGameLabelFont        =   UIFont(name: "Game of Thrones", size: 40)
        answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 30)
        canceViewButtonFont     =   UIFont(name: "cinzel", size: 40)
        finalScoreFont          =   UIFont(name: "cinzel", size: 105)
        break
    case Devices.fourteenProHeight.rawValue:
        gameLabelFont           =   UIFont(name: "Game of Thrones", size: 42)
        primaryLabelFont        =   UIFont(name: "cinzel", size: 37)
        secondaryLabelFont      =   UIFont(name: "cinzel", size: 18)
        subGameLabelFont        =   UIFont(name: "Game of Thrones", size: 35)
        answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 25)
        canceViewButtonFont     =   UIFont(name: "cinzel", size: 35)
        finalScoreFont          =   UIFont(name: "cinzel", size: 95)
        break
    case Devices.twelveHeight.rawValue:
        gameLabelFont           =   UIFont(name: "Game of Thrones", size: 42)
        primaryLabelFont        =   UIFont(name: "cinzel", size: 37)
        secondaryLabelFont      =   UIFont(name: "cinzel", size: 18)
        subGameLabelFont        =   UIFont(name: "Game of Thrones", size: 35)
        answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 25)
        canceViewButtonFont     =   UIFont(name: "cinzel", size: 35)
        finalScoreFont          =   UIFont(name: "cinzel", size: 95)
        break
    case Devices.elevenAndProMaxHeight.rawValue:
        gameLabelFont           =   UIFont(name: "Game of Thrones", size: 42)
        primaryLabelFont        =   UIFont(name: "cinzel", size: 39)
        secondaryLabelFont      =   UIFont(name: "cinzel", size: 22)
        subGameLabelFont        =   UIFont(name: "Game of Thrones", size: 38)
        answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 28)
        canceViewButtonFont     =   UIFont(name: "cinzel", size: 38)
        finalScoreFont          =   UIFont(name: "cinzel", size: 100)
        break
    case Devices.elevenProHeight.rawValue:
        gameLabelFont           =   UIFont(name: "Game of Thrones", size: 40)
        primaryLabelFont        =   UIFont(name: "cinzel", size: 35)
        secondaryLabelFont      =   UIFont(name: "cinzel", size: 18)
        subGameLabelFont        =   UIFont(name: "Game of Thrones", size: 33)
        answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 23)
        canceViewButtonFont     =   UIFont(name: "cinzel", size: 33)
        finalScoreFont          =   UIFont(name: "cinzel", size: 90)
        break
    case Devices.eightPlusHeight.rawValue:
        gameLabelFont           =   UIFont(name: "Game of Thrones", size: 40)
        primaryLabelFont        =   UIFont(name: "cinzel", size: 33)
        secondaryLabelFont      =   UIFont(name: "cinzel", size: 20)
        subGameLabelFont        =   UIFont(name: "Game of Thrones", size: 33)
        answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 23)
        canceViewButtonFont     =   UIFont(name: "cinzel", size: 33)
        finalScoreFont          =   UIFont(name: "cinzel", size: 90)
        break
    case Devices.eightHeight.rawValue:
        gameLabelFont           =   UIFont(name: "Game of Thrones", size: 35)
        primaryLabelFont        =   UIFont(name: "cinzel", size: 32)
        secondaryLabelFont      =   UIFont(name: "cinzel", size: 17)
        subGameLabelFont        =   UIFont(name: "Game of Thrones", size: 30)
        answerButtonFont        =   UIFont(name: "Cormorant-Regular", size: 20)
        canceViewButtonFont     =   UIFont(name: "cinzel", size: 30)
        finalScoreFont          =   UIFont(name: "cinzel", size: 80)
        break
    case Devices.sEHeight.rawValue:
        // no need to do these as the SE/iPod Touch 7 is what the default values are set to
        break
    case Devices.bigiPadProHeight.rawValue:
        break
    case Devices.airThreeHeight.rawValue:
        break
    case Devices.airTwoHeight.rawValue:
        break
    default:
        
        break
    }
}

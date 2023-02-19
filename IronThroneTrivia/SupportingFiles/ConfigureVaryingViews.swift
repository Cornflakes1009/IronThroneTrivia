import UIKit


// MARK: Screen Sizes - h x w
/*
 
 https://www.ios-resolution.com/
 
 iPhones
 14 Pro Max                                 =       932 x 430
 14+, 13 Pro Max, 12 Pro Max                =       926 x 428
 11 Pro Max, 11, XS Max, XR                 =       896 x 414
 14 Pro                                     =       852 x 393
 14, 13 Pro, 13, 12 Pro, 12                 =       844 x 390
 13M, 12M, 11 Pro, XS, X                    =       812 x 375
 8+, 7+, 6S+, 6+                            =       736 x 414
 8, 7, 6s, 6, SE2-3                         =       667 x 375
 SE1, Touch 5-7, 5C, 5S, 5                  =       568 x 320


 iPads
 12.9" Pro 1-6                              =       1366 x 1024
 10.5" Pro 3, Air 3                         =       1112 x 834
 9.7" Pro 1, Air 1-2, Mini 1-5, 1-6         =       1024 x 768
 7-9                                        =       1080 x 810
 11" Pro 3-6                                =       1194 x 834
 10, Air 4-5                                =       1180 x 820
*/

enum Devices: CGFloat {
    // iPhones
    case fourteenProMaxHeight       =     932
    case twelveProMaxHeight         =     926
    case elevenAndProMaxHeight      =     896
    case fourteenProHeight          =     852
    case twelveHeight               =     844
    case elevenProHeight            =     812
    case eightPlusHeight            =     736
    case eightHeight                =     667
    case sEHeight                   =     568
    
    // iPads
    case twelvePointNineHeight      =     1366
    case iPadTenHeight              =     1180
    case airThreeHeight             =     1112
    case airTwoHeight               =     1024
    case iPadNineHeight             =     1080
    case iPadProElevenInchHeight    =     1194
}

public func varyForScreenSizes(screenHeight: CGFloat) {
    switch screenHeight {
    case Devices.fourteenProMaxHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 45)
        primaryLabelFont        =   UIFont(name: cinzel, size: 40)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 22)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 40)
        answerButtonFont        =   UIFont(name: cormorant, size: 30)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 40)
        finalScoreFont          =   UIFont(name: cinzel, size: 105)
        break
    case Devices.twelveProMaxHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 45)
        primaryLabelFont        =   UIFont(name: cinzel, size: 40)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 22)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 40)
        answerButtonFont        =   UIFont(name: cormorant, size: 30)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 40)
        finalScoreFont          =   UIFont(name: cinzel, size: 105)
        break
    case Devices.fourteenProHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 42)
        primaryLabelFont        =   UIFont(name: cinzel, size: 37)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 18)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 35)
        answerButtonFont        =   UIFont(name: cormorant, size: 25)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 35)
        finalScoreFont          =   UIFont(name: cinzel, size: 95)
        break
    case Devices.twelveHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 42)
        primaryLabelFont        =   UIFont(name: cinzel, size: 37)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 18)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 35)
        answerButtonFont        =   UIFont(name: cormorant, size: 25)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 35)
        finalScoreFont          =   UIFont(name: cinzel, size: 95)
        break
    case Devices.elevenAndProMaxHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 42)
        primaryLabelFont        =   UIFont(name: cinzel, size: 39)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 22)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 38)
        answerButtonFont        =   UIFont(name: cormorant, size: 28)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 38)
        finalScoreFont          =   UIFont(name: cinzel, size: 100)
        break
    case Devices.elevenProHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 40)
        primaryLabelFont        =   UIFont(name: cinzel, size: 35)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 18)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 33)
        answerButtonFont        =   UIFont(name: cormorant, size: 23)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 33)
        finalScoreFont          =   UIFont(name: cinzel, size: 90)
        break
    case Devices.eightPlusHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 40)
        primaryLabelFont        =   UIFont(name: cinzel, size: 33)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 20)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 33)
        answerButtonFont        =   UIFont(name: cormorant, size: 23)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 33)
        finalScoreFont          =   UIFont(name: cinzel, size: 90)
        break
    case Devices.eightHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 35)
        primaryLabelFont        =   UIFont(name: cinzel, size: 32)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 17)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 30)
        answerButtonFont        =   UIFont(name: cormorant, size: 20)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 30)
        finalScoreFont          =   UIFont(name: cinzel, size: 80)
        break
    case Devices.sEHeight.rawValue:
        // no need to do these as the SE/iPod Touch 7 is what the default values in Constants.swift are set to
        break
    case Devices.twelvePointNineHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 80)
        primaryLabelFont        =   UIFont(name: cinzel, size: 75)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 50)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 75)
        answerButtonFont        =   UIFont(name: cormorant, size: 60)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 75)
        finalScoreFont          =   UIFont(name: cinzel, size: 150)
        break
    case Devices.airThreeHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 70)
        primaryLabelFont        =   UIFont(name: cinzel, size: 65)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 40)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 65)
        answerButtonFont        =   UIFont(name: cormorant, size: 55)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 65)
        finalScoreFont          =   UIFont(name: cinzel, size: 130)
        break
    case Devices.airTwoHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 60)
        primaryLabelFont        =   UIFont(name: cinzel, size: 55)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 35)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 55)
        answerButtonFont        =   UIFont(name: cormorant, size: 45)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 55)
        finalScoreFont          =   UIFont(name: cinzel, size: 120)
        break
    case Devices.iPadNineHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 65)
        primaryLabelFont        =   UIFont(name: cinzel, size: 60)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 38)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 60)
        answerButtonFont        =   UIFont(name: cormorant, size: 50)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 60)
        finalScoreFont          =   UIFont(name: cinzel, size: 125)
        break
    case Devices.iPadTenHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 70)
        primaryLabelFont        =   UIFont(name: cinzel, size: 65)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 40)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 65)
        answerButtonFont        =   UIFont(name: cormorant, size: 55)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 65)
        finalScoreFont          =   UIFont(name: cinzel, size: 130)
        break
    case Devices.iPadProElevenInchHeight.rawValue:
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 70)
        primaryLabelFont        =   UIFont(name: cinzel, size: 65)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 40)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 65)
        answerButtonFont        =   UIFont(name: cormorant, size: 55)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 65)
        finalScoreFont          =   UIFont(name: cinzel, size: 130)
        break
    default:
        break
    }
}

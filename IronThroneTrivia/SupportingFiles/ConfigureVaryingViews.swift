import UIKit


// MARK: Screen Sizes - h x w
/*
 
https://screensizes.app/?compare=ipad
 
iPhones
14 Pro Max, 15+, 15 Pro Max                =       932 x 430
14+, 13 Pro Max, 12 Pro Max                =       926 x 428
11 Pro Max, 11, XS Max, XR                 =       896 x 414
14 Pro, 15, 15 Pro                         =       852 x 393
14, 13 Pro, 13, 12 Pro, 12                 =       844 x 390
13 Mini, 12 Mini, 11 Pro, XS, X            =       812 x 375
8+, 7+, 6S+, 6+                            =       736 x 414
8, 7, 6s, 6, SE2-3                         =       667 x 375
SE1, Touch 5-7, 5C, 5S, 5                  =       568 x 320

---------------------------------------------------------------
 
iPads
13" Pro 7                                  =       1376 x 1032
12.9" Pro 1-6, 13" Air                     =       1366 x 1024
11" Pro 7                                  =       1210 x 834
11" Pro 3-6                                =       1194 x 834
7-10, Air 4-5                              =       1180 x 820
Mini 6                                     =       1133 x 744
10.5" Pro 3, Air 3                         =       1112 x 834
7-9                                        =       1080 x 810
9.7" Pro 1, Air 1-2, Mini 1-5, 1-6         =       1024 x 768
*/

// Keeping for future copy/paste
//func configureVaryingSizes(screenSize: CGFloat) {
//    switch screenSize {
//    case 1300...1400:
//        print("")
//    case 1200...1299:
//        print("")
//    case 1100...1199:
//        print("")
//    case 1000...1099:
//        print("")
//    case 900...999:
//        print("")
//    case 800...899:
//        print("")
//    case 700...799:
//        print("")
//    case 600...699:
//        print("")
//    case 500...599:
//        print("")
//    default:
//        print("")
//    }
//}

public func varyForScreenSizes(screenHeight: CGFloat) {

    switch screenHeight {
// MARK: - iPads
    case 1300...1400: // 13" Air
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 80)
        primaryLabelFont        =   UIFont(name: cinzel, size: 75)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 50)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 75)
        answerButtonFont        =   UIFont(name: cormorant, size: 60)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 75)
        finalScoreFont          =   UIFont(name: cinzel, size: 150)
    case 1200...1299: // 11" Pro 7 (M4)
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 70)
        primaryLabelFont        =   UIFont(name: cinzel, size: 65)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 40)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 65)
        answerButtonFont        =   UIFont(name: cormorant, size: 55)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 65)
        finalScoreFont          =   UIFont(name: cinzel, size: 130)
    case 1100...1199: // Air 3
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 70)
        primaryLabelFont        =   UIFont(name: cinzel, size: 65)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 40)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 65)
        answerButtonFont        =   UIFont(name: cormorant, size: 55)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 65)
        finalScoreFont          =   UIFont(name: cinzel, size: 130)
    case 1000...1099: // iPad 6
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 60)
        primaryLabelFont        =   UIFont(name: cinzel, size: 55)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 35)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 55)
        answerButtonFont        =   UIFont(name: cormorant, size: 45)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 55)
        finalScoreFont          =   UIFont(name: cinzel, size: 120)
// MARK: - iPhones
    case 900...999: // 14+
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 45)
        primaryLabelFont        =   UIFont(name: cinzel, size: 40)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 22)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 40)
        answerButtonFont        =   UIFont(name: cormorant, size: 30)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 40)
        finalScoreFont          =   UIFont(name: cinzel, size: 105)
    case 851...899: // 15
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 42)
        primaryLabelFont        =   UIFont(name: cinzel, size: 37)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 18)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 35)
        answerButtonFont        =   UIFont(name: cormorant, size: 25)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 35)
        finalScoreFont          =   UIFont(name: cinzel, size: 95)
    case 800...850: // 13 Mini
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 40)
        primaryLabelFont        =   UIFont(name: cinzel, size: 35)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 18)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 33)
        answerButtonFont        =   UIFont(name: cormorant, size: 23)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 33)
        finalScoreFont          =   UIFont(name: cinzel, size: 90)
    case 700...799: // 8+
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 40)
        primaryLabelFont        =   UIFont(name: cinzel, size: 33)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 20)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 33)
        answerButtonFont        =   UIFont(name: cormorant, size: 23)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 33)
        finalScoreFont          =   UIFont(name: cinzel, size: 90)
    case 600...699: // 8
        gameLabelFont           =   UIFont(name: gameOfThrones, size: 35)
        primaryLabelFont        =   UIFont(name: cinzel, size: 32)
        secondaryLabelFont      =   UIFont(name: cinzel, size: 17)
        subGameLabelFont        =   UIFont(name: gameOfThrones, size: 30)
        answerButtonFont        =   UIFont(name: cormorant, size: 20)
        canceViewButtonFont     =   UIFont(name: cinzel, size: 30)
        finalScoreFont          =   UIFont(name: cinzel, size: 80)
    case 500...599: // SE1
        print("App is currently built to work with this size.")
    default:
        print("")
    }
}

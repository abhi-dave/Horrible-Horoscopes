//
//  ZodiacSign.swift
//  Horrible Horoscopes
//
//  Created by Abhishek Dave on 14/04/18.
//  Copyright © 2018 Sawyer Clever. All rights reserved.
//

import UIKit

class ZodiacSign: NSObject {
    
    var name: String
    var sign: UIImage
    
    init(name: String, sign: UIImage) {
        self.name = name
        self.sign = sign
    }
}

extension ZodiacSign {
    
    class func horoscopeData() -> [ZodiacSign] {
        //Array that holds the names of the zodiac signs
        let signs = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
        
        //Array that holds the images of the zodiac signs
        let signImage: [UIImage] = [
            UIImage(named: "aries")!,
            UIImage(named: "taurus")!,
            UIImage(named: "gemini")!,
            UIImage(named: "cancer")!,
            UIImage(named: "leo")!,
            UIImage(named: "virgo")!,
            UIImage(named: "libra")!,
            UIImage(named: "scorpio")!,
            UIImage(named: "sagittarius")!,
            UIImage(named: "capricorn")!,
            UIImage(named: "aquarius")!,
            UIImage(named: "pisces")!
        ]
        
        var arrHoroscope: [ZodiacSign] = []
        for index in 0 ..< signs.count {
            arrHoroscope.append(ZodiacSign(name: signs[index], sign: signImage[index]))
        }
        return arrHoroscope
    }
    
}

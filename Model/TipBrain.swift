//
//  tipBrain.swift
//  Tipsy
//
//  Created by klioop on 2021/03/03.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct TipBrain {
    var tip = TIP(finalSplit: "0.0", numPeople: "2", tipPercent: "10%", decimalPercent: 0.1)
    
    func getTipPercent() -> String {
        return tip.tipPercent
    }
    
    func getNumPeople() -> String {
        return tip.numPeople
    }
    
    func getSplit() -> String {
        return tip.finalSplit
    }
    
    mutating func setNumPeople(_ senderText: Double) {
        tip.numPeople = String(format: "%.0f", senderText)
    }
    
    mutating func setTipPercent(_ senderText: String) {
        tip.tipPercent = senderText
    }
    
    mutating func changeToDecimal() {
        var temp = tip.tipPercent
        temp.remove(at: temp.index(before: temp.endIndex))
        let decimalPercent = (Float(temp) ?? 0.0) / Float(100)
        tip.decimalPercent = decimalPercent
    }
    
    mutating func setFinalSplit(_ textFieldSender : String) {
        let totalWOTip = Float(textFieldSender) ?? 0.0
        let totalWITip = totalWOTip * (1 + (tip.decimalPercent))
        let numPeople = Float(tip.numPeople) ?? 2
        let split = totalWITip / numPeople
        tip.finalSplit = String(format: "%.2f", split)
    }
}

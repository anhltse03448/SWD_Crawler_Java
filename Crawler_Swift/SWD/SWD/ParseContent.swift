//
//  ParseContent.swift
//  SWD
//
//  Created by Anh Tuan on 3/15/17.
//  Copyright © 2017 Anh Tuan. All rights reserved.
//

import UIKit

class ParseContent: NSObject {
    var countBedroom : Int?
    var countWCRoom : Int?
    var descriptionStr : String
    init(descrip : String) {
        self.descriptionStr = descrip.lowercased()
    }
    func parseContent() {
        if let range = self.descriptionStr.range(of: "phòng ngủ") {
            let start = self.descriptionStr.distance(from: self.descriptionStr.characters.startIndex, to: range.lowerBound)
            if start >= 2 {
                let countBedroom = self.descriptionStr.substring(with: start-2 ..< start - 1)
                
            }
        }
        if let range = self.descriptionStr.range(of: "wc") {
            let start = self.descriptionStr.distance(from: self.descriptionStr.characters.startIndex, to: range.lowerBound)
            if start >= 2 {
                let countBathroom = self.descriptionStr.substring(with: start-2 ..< start - 1)
                if Int(countBathroom) != nil {
                    self.countWCRoom = Int(countBathroom)
                }
        //        NSLog("BathRoom \(countBedroom)")
            }
        }
        
        if let range = self.descriptionStr.range(of: "nhà vệ sinh") {
            let start = self.descriptionStr.distance(from: self.descriptionStr.characters.startIndex, to: range.lowerBound)
            if start >= 2 {
                let countBedroom = self.descriptionStr.substring(with: start-2 ..< start - 1)
                NSLog("BathRoom \(countBedroom)")
            }
        }
    }
}
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}

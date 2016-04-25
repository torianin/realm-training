//
//  extensions.swift
//  realm-training
//
//  Created by Robert Ignasiak on 25.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Foundation

extension Array {
    func sample() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

extension NSDate
{
    convenience
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
}

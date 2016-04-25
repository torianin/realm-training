//
//  Task.swift
//  realm-training
//
//  Created by Robert Ignasiak on 24.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    dynamic var information = ""
    dynamic var startdate:NSDate? = nil
    dynamic var enddate:NSDate? = nil
    dynamic var project:Project? = nil
}

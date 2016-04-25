//
//  Person.swift
//  realm-training
//
//  Created by Robert Ignasiak on 24.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    dynamic var name = ""
    dynamic var address:Address? = nil
}

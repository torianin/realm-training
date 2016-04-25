//
//  Department.swift
//  realm-training
//
//  Created by Robert Ignasiak on 24.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Foundation
import RealmSwift

class Department: Object {
    dynamic var name = ""
    dynamic var head: Employee? = nil
    dynamic var address: Address? = nil
}

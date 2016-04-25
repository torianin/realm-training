//
//  Project.swift
//  realm-training
//
//  Created by Robert Ignasiak on 24.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Foundation
import RealmSwift

class Project: Object {
    dynamic var name = ""
    dynamic var subject = ""
    let tasks = List<Task>()
    let employees = List<Employee>()
}

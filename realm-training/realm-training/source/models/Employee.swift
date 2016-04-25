//
//  Employee.swift
//  realm-training
//
//  Created by Robert Ignasiak on 24.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Foundation
import RealmSwift

class Employee: Object {
    dynamic var hiredate: NSDate? = nil
    dynamic var job = ""
    dynamic var salary = 0
    dynamic var department: Department? = nil
    let projects = List<Project>()
    dynamic var person:Person? = nil;

}

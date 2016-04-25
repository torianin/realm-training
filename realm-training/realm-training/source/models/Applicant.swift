//
//  Applicant.swift
//  realm-training
//
//  Created by Robert Ignasiak on 24.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Foundation
import RealmSwift

class Applicant: Object {
    dynamic var applicationdate: NSDate? = nil
    dynamic var position = ""
    dynamic var person:Person? = nil;
}

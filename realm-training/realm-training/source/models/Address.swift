//
//  Address.swift
//  realm-training
//
//  Created by Robert Ignasiak on 24.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Foundation
import RealmSwift

class Address: Object {
    dynamic var city = ""
    dynamic var street = ""
    dynamic var postcode = ""
    dynamic var department:Department? = nil
    dynamic var person:Employee? = nil;
}

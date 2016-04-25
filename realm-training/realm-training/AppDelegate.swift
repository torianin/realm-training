//
//  AppDelegate.swift
//  realm-training
//
//  Created by Robert Ignasiak on 24.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Cocoa
import RealmSwift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        setRealm()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func seedDatabase(sender: AnyObject) {
        let databaseHelper:DatabaseHelper = DatabaseHelper()
        databaseHelper.SeedDatabase()

    }
    
    func setRealm(){
        var config = Realm.Configuration()
        config.fileURL = NSURL.fileURLWithPath("/Users/torianin/realm-training/realm-training/realm-training/source/db/default.realm")
        Realm.Configuration.defaultConfiguration = config
    }

    @IBAction func findCities(sender: AnyObject) {
        let realm = try! Realm()
        
        let addressesFromDataBase = realm.objects(Address)
        print(addressesFromDataBase)
    }
}


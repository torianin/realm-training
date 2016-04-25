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
    
    @IBOutlet weak var aTaskValueTextField: NSTextField!
    @IBOutlet weak var bTaskFirstValueTextField: NSTextField!
    @IBOutlet weak var bTaskSecondValueTextField: NSTextField!
    @IBOutlet weak var cTaskValueTextField: NSTextField!
    
    @IBOutlet var outputTextView: NSTextView!
    
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
        
        outputTextView.textStorage?.mutableString.setString("")
        
        var counts:[String:Int] = [:]
        var cities = Set<String>()
        
        let addressesFromDatabase = realm.objects(Address)
        for address in addressesFromDatabase {
            counts[address.city] = (counts[address.city] ?? 0) + 1
            if(counts[address.city] > Int(aTaskValueTextField.stringValue)) {
                cities.insert(address.city)
            }
        }
        for city in cities{
            outputTextView.insertText("\(city) -> \(counts[city]!) \n")
        }

    }
    
    @IBAction func findAvgSales(sender: AnyObject) {
        let realm = try! Realm()
        
        outputTextView.textStorage?.mutableString.setString("")
        
        var counts:[String:Int] = [:]
        var sales:[String:Int] = [:]
        
        let addressesFromDatabase = realm.objects(Address)
        for address in addressesFromDatabase {
            counts[address.city] = (counts[address.city] ?? 0) + 1
            sales[address.city] = (sales[address.city] ?? 0) + (address.person?.salary)!
        }
        
        for address in addressesFromDatabase{
            let avgValue = sales[address.city]!/counts[address.city]!
            if (avgValue > Int(bTaskFirstValueTextField.stringValue) && avgValue < Int(bTaskSecondValueTextField.stringValue)) {
                outputTextView.insertText("\(address.city) -> \(avgValue) \n")
            }
        }
    }
    @IBAction func findProjects(sender: AnyObject) {
        let realm = try! Realm()
        
        outputTextView.textStorage?.mutableString.setString("")
        
        var count = 0
        var sales = 0

        let employeesFromDatabase = realm.objects(Employee)

        for employee in employeesFromDatabase {
            for project in employee.projects {
                var taskTimeSum = 0
                for task in project.tasks {
                    let calendar = NSCalendar.currentCalendar()
                    let calendarComponents = calendar.components(.Month, fromDate: task.startdate!, toDate: task.enddate!, options: [])
                    taskTimeSum = taskTimeSum + calendarComponents.month
                }
                if taskTimeSum > Int(cTaskValueTextField.stringValue) {
                    count = count + 1
                    sales = sales + employee.salary
                }
            }
        }
        outputTextView.insertText("\(count) -> \(sales/count) \n")

    }
}
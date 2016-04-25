//
//  Seed.swift
//  realm-training
//
//  Created by Robert Ignasiak on 24.04.2016.
//  Copyright © 2016 Robert Ignasiak. All rights reserved.
//

import Foundation
import RealmSwift
import Fakery



public class DatabaseHelper {
    func SeedDatabase() -> Void{
        
        let realm = try! Realm()
        let faker = Faker(locale: "pl")

        var addresses = Array<Address>()
        var employees = Array<Employee>()
        var projects = Array<Project>()
        var tasks = Array<Task>()

        for _ in 0...200 {
            let task:Task =  Task();
            let taskInformations = ["Systemy Wspomagania Lista 3", "Nowe Technologie Baz Danych Lista 4", "Dedukcyjne bazy danych Lista 7"]
            task.information = taskInformations.sample()
            
            let begin_year = faker.number.randomInt(min: 2012, max: 2014)
            let begin_month =  NSString(format: "%02d", faker.number.randomInt(min:1, max:12))
            let begin_day = faker.number.randomInt(min:1, max: 28)
            
            let end_year = faker.number.randomInt(min: 2015, max: 2016)
            let end_month =  NSString(format: "%02d", faker.number.randomInt(min:1, max:12))
            let end_day = faker.number.randomInt(min:1, max: 28)
            
            task.startdate = NSDate(dateString:"\(begin_year)-\(begin_month)-\(begin_day)")
            task.enddate = NSDate(dateString:"\(end_year)-\(end_month)-\(end_day)")
            tasks.append(task);
        }
        
        for _ in 0...500 {
            let projectNames = ["Tescik", "El Grocer", "Instagramx", "Wieliczka", "Torianin", "3D Tracker", "Tinderx", "Facebooks"]
            let projectSubjects = ["System finansowo-ksiegowy", "Aplikacja Mobilna", "Strona Internetowa", "Portal wymiany dokumentów", "Baza Danych", "Aplikacja Webowa"]
            let project:Project = Project();
            project.name = projectNames.sample()
            project.subject = projectSubjects.sample()
            
            for _ in 0...faker.number.randomInt(min: 1, max: 12){
                let task = tasks.sample()
                if task.project == nil {
                    project.tasks.append(task)
                    task.project = project
                }
            }
            projects.append(project)
        }

        for _ in 1...200 {
            let address:Address = Address()
            address.city = faker.address.city()
            address.street = faker.address.streetName()
            address.postcode = faker.address.postcode()
            addresses.append(address)
        }
        
        for i in 1...200 {
            let employee = Employee()
            employee.person = Person(
                value: [
                    "name": faker.name.name(),
                    "address": addresses[i-1]
                ]
            )
            let year = faker.number.randomInt(min: 2014, max: 2016)
            let month =  NSString(format: "%02d", faker.number.randomInt(min:1, max:12))
            let day = faker.number.randomInt(min:1, max: 28)
            
            employee.hiredate = NSDate(dateString:"\(year)-\(month)-\(day)")
            employee.job  = "Swift Developer"
            employee.salary = faker.number.randomInt(min: 2000, max: 5000)
            for _ in 0...faker.number.randomInt(min: 1, max: 12){
                let project = projects.sample()
                    project.employees.append(employee)
                    employee.projects.append(project)
            }
            employees.append(employee)
        }
        
        for i in 0..<addresses.count {
            addresses[i].person = employees[i];
        }
        
        try! realm.write {
            realm.add(addresses)
            realm.add(employees)
            realm.add(projects)
            realm.add(tasks)
        }
    }
}

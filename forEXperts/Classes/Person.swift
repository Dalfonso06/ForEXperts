//
//  Person.swift
//  forEXperts
//
//  Created by Daniel Alfonso on 7/17/22.
//

import Foundation

// Used to display personal information and for the login
class Person {
    
    var firstName: String
    var lastName: String
    var loginName: String
    var password: String
    
    init(firstName: String, lastName: String, loginName: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.loginName = loginName
        self.password = password
    }
}

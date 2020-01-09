//
//  StudentClass.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 27.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class StudentProfile {
    var name: String?
    var lastName: String?
    var age: Int?
    var city: String?
    var userPic: String?
    var phone: String?
    var mail: String?
    var studentlatitude: Double?
    var studentLongitude: Double?
    var studentId: String?
}

class StudentsInfo {
    func getStudents() -> [StudentProfile] {
        let firstStudent = StudentProfile()
        firstStudent.studentId = "1001"
        firstStudent.name = "Alekseii"
        firstStudent.lastName = "Sorochan"
        firstStudent.age = 36
        firstStudent.city = "Kyiv"
        firstStudent.phone = "+380630771072"
        firstStudent.mail = "redik.line@gmail.com"
        firstStudent.userPic = "first"
        firstStudent.studentlatitude = 50.4442339
        firstStudent.studentLongitude = 30.4967772
        
        let secondStudent = StudentProfile()
        secondStudent.studentId = "1002"
        secondStudent.city = "Kyiv"
        secondStudent.name = "Michail"
        secondStudent.lastName = "Tsyba"
        secondStudent.phone = "+380503387901"
        secondStudent.userPic = "second"
        secondStudent.studentlatitude = 50.4608546
        secondStudent.studentLongitude = 30.5243962
        
        let thirdStudent = StudentProfile()
        thirdStudent.name = "Valeriia"
        thirdStudent.lastName = "Zakharova"
        thirdStudent.city = "Kharkiv"
        thirdStudent.userPic = "third"
        thirdStudent.studentlatitude = 50.4422181
        thirdStudent.studentLongitude = 30.5185508
   
        let fourthStudent = StudentProfile()
        fourthStudent.studentlatitude = 50.4678804
        fourthStudent.studentLongitude = 30.5141128
        
        let fifthStudent = StudentProfile()
        fifthStudent.name = "Kiril"
        fifthStudent.lastName = "Trembovetskyi"
        fifthStudent.phone = "‭+380935242028‬"
        fifthStudent.city = "Kyiv"
        fifthStudent.userPic = "fifth"
        fifthStudent.studentlatitude = 50.4733188
        fifthStudent.studentLongitude = 30.5896244
        
        return [firstStudent, secondStudent, thirdStudent, fifthStudent, fourthStudent]
    }
}

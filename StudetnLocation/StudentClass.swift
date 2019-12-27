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
    var userPic: String?
    var phone: String?
    var mail: String?
    var studentlatitude: Double?
    var studentLongitude: Double?
}

class StudentsInfo {
    func getStudents() -> [StudentProfile] {
        let firstStudent = StudentProfile()
//        firstStudent.studentlatitude = 50.4442685
//        firstStudent.studentLongitude = 30.4964163
        
        
        let secondStudent = StudentProfile()
//        secondStudent.studentlatitude = 50.4608976
//        secondStudent.studentLongitude = 30.5223197
        
        let thirdStudent = StudentProfile()
        thirdStudent.studentlatitude = 50.4676762
        thirdStudent.studentLongitude = 30.5140305
        
        

        let fourth = StudentProfile()
        
        return [firstStudent, secondStudent, thirdStudent, fourth]
    }
}

//
//  ListViewController.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 27.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    var students: [StudentProfile] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        students = StudentsInfo().getStudents()

    }
    

}

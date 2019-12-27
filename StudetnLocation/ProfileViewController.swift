//
//  ProfileViewController.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 27.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var studentProfile = StudentProfile()
    var recieveProfile = StudentProfile()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentProfile = recieveProfile
        debugPrint(studentProfile.name ?? "")

    }
    


}

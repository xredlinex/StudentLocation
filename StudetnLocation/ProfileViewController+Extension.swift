//
//  ProfileViewController+Extension.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 28.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

extension ProfileViewController {
    func feelUserData() {
        
        if hideShowLocationButton == true {
            hideLocationHeightConstraint.priority = UILayoutPriority(rawValue: 800)
        }
        studentPictureImageView.image = UIImage(named: studentProfile.userPic ?? "noUserPic")
        studentNameTextLabel.text = studentProfile.name ?? "no student name"
        studentLastNameTextLabel.text = studentProfile.lastName ?? "no student last name"
        studentCityTextLabel.text =  studentProfile.city?.uppercased() ?? "-"
        
        if let age = studentProfile.age {
            studentAgeTextLabel.text = "\(age)"
        }
    }
}

extension ProfileViewController {
    func visualUIUpdate() {
        setBackground()
        callView.customButton()
        messageView.customButton()
        emailView.customButton()
        locationView.customButton()
    
        viewForUserPictureView.isUserInteractionEnabled = false
        viewForUserPictureView.clipsToBounds = true
        viewForUserPictureView.layer.cornerRadius = viewForUserPictureView.frame.width / 2
        viewForUserPictureView.layer.borderColor = UIColor.systemYellow.cgColor
        viewForUserPictureView.layer.borderWidth = 2
        studentPictureImageView.contentMode = .scaleAspectFill
    }
}

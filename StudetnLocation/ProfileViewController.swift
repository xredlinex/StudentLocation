//
//  ProfileViewController.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 27.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var viewForUserPictureView: UIView!
    @IBOutlet weak var studentPictureImageView: UIImageView!
    @IBOutlet weak var studentNameTextLabel: UILabel!
    @IBOutlet weak var studentLastNameTextLabel: UILabel!
    @IBOutlet weak var studentAgeTextLabel: UILabel!
    @IBOutlet weak var studentCityTextLabel: UILabel!
    
    
    
    var studentProfile = StudentProfile()
    var recieveProfile = StudentProfile()

    @IBOutlet weak var hideLocationHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visualUIUpdate()
        studentProfile = recieveProfile
        feelUserData()
        

    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapCalMeActionButton(_ sender: Any) {
    }
    @IBAction func didTapMessageMeActionButton(_ sender: Any) {
    }
    
    @IBAction func didTapEmailMeActionButton(_ sender: Any) {
    }
    @IBAction func didTapLocationActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "LocationViewController") as! LocationViewController
        viewController.recieveData = studentProfile
        navigationController?.pushViewController(viewController, animated: false)
    }
}

extension ProfileViewController {
    func feelUserData() {
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
        
        viewForUserPictureView.isUserInteractionEnabled = false
        viewForUserPictureView.clipsToBounds = true
        viewForUserPictureView.layer.cornerRadius = viewForUserPictureView.frame.width / 2
        viewForUserPictureView.layer.borderColor = UIColor.white.cgColor
        viewForUserPictureView.layer.borderWidth = 2
        studentPictureImageView.contentMode = .scaleAspectFill
        
        
        
    }
}

//
//  ProfileViewController.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 27.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit
import MessageUI

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var viewForUserPictureView: UIView!
    @IBOutlet weak var studentPictureImageView: UIImageView!
    @IBOutlet weak var studentNameTextLabel: UILabel!
    @IBOutlet weak var studentLastNameTextLabel: UILabel!
    @IBOutlet weak var studentAgeTextLabel: UILabel!
    @IBOutlet weak var studentCityTextLabel: UILabel!
    @IBOutlet weak var callView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var hideLocationHeightConstraint: NSLayoutConstraint!
    
    var studentProfile = StudentProfile()
    var recieveProfile = StudentProfile()
    
    var hideShowLocationButton = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        visualUIUpdate()
        studentProfile = recieveProfile
        fillUserData()
    }
    
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapCalMeActionButton(_ sender: Any) {
        if let number = studentProfile.phone {
            makeACall(number)
        }
    }
    
    @IBAction func didTapMessageMeActionButton(_ sender: Any) {
        if let number = studentProfile.phone {
            if let latitude = studentProfile.studentlatitude, let longitude = studentProfile.studentLongitude {
                sendSms(number, latitude, longitude)
            } else {
                sendSmsEmpty(number)
            }
        }
    }
    
    @IBAction func didTapEmailMeActionButton(_ sender: Any) {
//        if let mail = studentProfile.mail {
//            sendEmail(mail)
//        }
        if let mail = studentProfile.mail {
            if let latitude = studentProfile.studentlatitude, let longitude = studentProfile.studentLongitude {
                sendEmail(mail, latitude, longitude)
            }
        }
    }
    
    @IBAction func didTapLocationActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "LocationViewController") as! LocationViewController
        viewController.recieveData = studentProfile
        navigationController?.pushViewController(viewController, animated: false)
    }
}

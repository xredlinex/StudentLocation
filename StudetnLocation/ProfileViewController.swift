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
        feelUserData()
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
//        if let
        
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
    func makeACall(_ studentPhone: String) {
        guard let phoneNumber = URL(string: "tel://" + studentPhone) else {
            return
        }
        UIApplication.shared.open(phoneNumber)
        
    }
    func sendSms(_ studentPhone: String) {
        if MFMessageComposeViewController.canSendText() {
            let message = MFMessageComposeViewController()
            message.messageComposeDelegate = self
            message.recipients = [studentPhone]
            message.body = ""
            present(message, animated: true, completion: nil)
        }
        
    }
    
    func sendEmail(_ studentMail: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMessageComposeViewController()
            mail.messageComposeDelegate = self
            mail.recipients = [studentMail]
            
        }
  
    }
    
}

extension ProfileViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            debugPrint("mail cancelled")
        case .failed:
            debugPrint("mail failed")
        case .sent:
            debugPrint("mail sent")
        case .saved:
            debugPrint("mail saved")
        default:
            debugPrint("something wrong")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case .cancelled:
            debugPrint("message cancel")
        case .failed:
            debugPrint("message failed")
        case .sent:
            debugPrint("message sent")
        default:
            debugPrint("something wrond")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

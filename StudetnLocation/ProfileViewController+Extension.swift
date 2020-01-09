//
//  ProfileViewController+Extension.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 28.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit
import MessageUI

//  MARK: - fill in student labels and hide button if need
extension ProfileViewController {
    func fillUserData() {
        
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

// MARK: - Call, Message, Mail 
extension ProfileViewController {
    func makeACall(_ studentPhone: String) {
        guard let phoneNumber = URL(string: "tel://" + studentPhone) else {
            return
        }
        UIApplication.shared.open(phoneNumber)
    }
    
    func sendSms(_ studentPhone: String,_ studentLatitude: Double,_ studentLongitude: Double ) {
        if MFMessageComposeViewController.canSendText() {
            let message = MFMessageComposeViewController()
            message.messageComposeDelegate = self
            message.recipients = [studentPhone]
            message.body = "https://www.google.com/maps/@\(studentLatitude),\(studentLongitude),18z"
            present(message, animated: true, completion: nil)
        }
    }
    func sendSmsEmpty(_ studentPhone: String) {
        if MFMessageComposeViewController.canSendText() {
            let message = MFMessageComposeViewController()
            message.messageComposeDelegate = self
            message.recipients = [studentPhone]
            message.body = "No user cordinates, sorry"
            present(message, animated: true, completion: nil)
        }
    }
    
    func sendEmail(_ studentMail: String,_ studentLatitude: Double,_ studentLongitude: Double ) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            let message = EmailMessageBodyText().emailMessageBodyText(studentLatitude, studentLongitude)
            mail.mailComposeDelegate = self
            mail.setToRecipients([studentMail])
            mail.setSubject("Student Location")
            mail.setMessageBody(message, isHTML: true)
            present(mail, animated: true, completion: nil)
        }
    }
}

//  MARK: - Compose Delegate mail
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

//  MARK: - Compose Delegate Message
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

// MARK: - UI Elements Design + buttons
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

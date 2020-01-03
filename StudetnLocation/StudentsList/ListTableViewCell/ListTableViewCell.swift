//
//  ListTableViewCell.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 28.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var contentCellView: UIView!
    @IBOutlet weak var viewForAvatarView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var lastNameTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
    
extension ListTableViewCell {
    func updateCell(student: StudentProfile) {
        
        avatarImageView.image = UIImage(named: student.userPic ?? "noUserPic")
        nameTextLabel.text = student.name ?? ""
        lastNameTextLabel.text = student.lastName ?? ""
        
        viewForAvatarView.clipsToBounds = true
        viewForAvatarView.layer.cornerRadius = viewForAvatarView.frame.width / 2
        viewForAvatarView.layer.borderColor = UIColor.systemYellow.cgColor
        viewForAvatarView.layer.borderWidth = 2
        avatarImageView.contentMode = .scaleAspectFill
        contentCellView.clipsToBounds = true
        contentCellView.layer.cornerRadius = 12
    }
}

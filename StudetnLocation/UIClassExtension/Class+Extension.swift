//
//  Class+Extension.swift
//  StudetnLocation
//
//  Created by alexey sorochan on 28.12.2019.
//  Copyright © 2019 alexey sorochan. All rights reserved.
//

import UIKit

extension UIView {
    func customButton() {
        clipsToBounds = true
        layer.cornerRadius = 12.0
        backgroundColor = UIColor(red: 19/255, green: 58/255, blue: 84/255, alpha: 1)
    }
}

extension UIViewController {
    func setBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        let backgroundForImage = UIView(frame: UIScreen.main.bounds)
        let blackBackground = UIView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundForImage.backgroundColor = UIColor.lightGray
        backgroundForImage.alpha = 0.7
        blackBackground.backgroundColor = UIColor.black
        blackBackground.alpha = 0.4
        view.addSubview(blackBackground)
        view.addSubview(backgroundImage)
        view.addSubview(backgroundForImage)
        self.view.sendSubviewToBack(blackBackground)
        self.view.sendSubviewToBack(backgroundForImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
}

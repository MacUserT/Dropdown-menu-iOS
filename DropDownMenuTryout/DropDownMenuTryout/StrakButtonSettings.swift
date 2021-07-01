//
//  StrakButtonSettings.swift
//  SegmentedControlTryout
//
//  Created by Paul Hertroys on 11/07/2020.
//  Copyright © 2020 Paul Hertroys. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setAttributes(with title: String) {
        
        let attr: [NSAttributedString.Key : Any] =
            [NSAttributedString.Key.font: UIFont(name: "Futura-CondensedExtraBold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        let buttonText = NSAttributedString(string: title, attributes: attr)
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.backgroundColor = UIColor(red: 57.0/255.0, green: 212.0/255.0, blue: 84.0/255.0, alpha: 1.0)
        if title == "GET STARTED" {
            self.setImage(UIImage(systemName: "bolt.fill")?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal), for: .normal)
        }
        self.setAttributedTitle(buttonText, for: .normal)
        self.layer.cornerRadius = 28
    }
	
	func setStartButton(with title: String, and image: UIImage) {
		
		let spacing: CGFloat = 20
        let attr: [NSAttributedString.Key : Any] =
			[NSAttributedString.Key.font: UIFont(name: "Futura-CondensedExtraBold", size: 12)!,
				NSAttributedString.Key.foregroundColor: UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 19.0/255.0, alpha: 0.3)]
        let buttonText = NSAttributedString(string: title, attributes: attr)
		let titleInset = UIEdgeInsets(top: image.size.height + spacing, left: 0, bottom: 0, right: 0)
		let imageInset = UIEdgeInsets(top: 0, left: self.frame.size.width / 2.0, bottom: 0, right: 0)

		self.setAttributedTitle(buttonText, for: .normal)
		self.setImage(image, for: .normal)
		self.titleEdgeInsets = titleInset
		self.imageEdgeInsets = imageInset
	}
}

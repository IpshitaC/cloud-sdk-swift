//
//  Extensions.swift
//  KenticoCloud
//
//  Created by Martin Makarsky on 26/09/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

extension UIButton {
    
    func stylePinkButton() {
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
    }
}

extension UILabel {
    func styleWithRichtextString(richtextString: String) {
        do {
            let attributedString = try NSMutableAttributedString(data: richtextString.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options:[.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil)
            
            
            let fontSizeAttribute = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16.0)]
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 1.5
            let lineSpacingAttribute = [NSAttributedStringKey.paragraphStyle : paragraphStyle]
            
            attributedString.addAttributes(fontSizeAttribute, range: NSMakeRange(0, attributedString.length))
            attributedString.addAttributes(lineSpacingAttribute, range: NSMakeRange(0, attributedString.length))
            
            self.attributedText = attributedString
        } catch {
            print(error)
        }
    }
}

extension UIImageView {
    func addBorder() {
        self.layer.borderColor = AppConstants.imageBorderColor.cgColor
        self.layer.borderWidth = 2
    }
}

extension Date {
    func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}

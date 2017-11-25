//
//  Extension.swift
//  ClothesShop
//
//  Created by ngovantucuong on 11/16/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomLine(borderColor: UIColor, textColor: UIColor, placeHolderColor: UIColor, placeHolder: String) {
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        let height: CGFloat = 1.0
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: (self.frame.height) - height, width: self.frame.width, height: height)
        self.textColor = textColor
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
        self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
    }
}

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

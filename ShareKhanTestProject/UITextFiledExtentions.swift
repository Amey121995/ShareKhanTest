//
//  UITextFiledExtentions.swift
//  ShareKhanTestProject
//
//  Created by Amey Dalvi on 27/05/24.
//

import Foundation
import UIKit
extension UITextField{
    
    func setDefaultTextFiled(rightIcon: UIImage?)
    {
        self.layer.borderColor = UIColor.textColor1().cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.bounds.size.height / 2.1
        
        if rightIcon == nil{
            
        }
        else{
            var imageView = UIImageView();
            var image = UIImage(named: "email.png")
            imageView.image = image
            self.rightView = imageView
        }
        
    
    }
}

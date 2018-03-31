//
//  customButton.swift
//  SkyWalkAR
//
//  Created by Ayush Verma on 31/03/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit

@IBDesignable
class customButton: UIButton {
    
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.white{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

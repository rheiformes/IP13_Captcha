//
//  CaptchaButton.swift
//  IP13_Captcha
//
//  Created by Rai, Rhea on 3/28/23.
//

import UIKit

class CaptchaButton: UIButton, Shakeable {
    
    
    var correct: Bool = false
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration     = 0.05
        animation.repeatCount  = 3
        animation.autoreverses = true
        animation.fromValue    = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue      = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }

    
    
    

}

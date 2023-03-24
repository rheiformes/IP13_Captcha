//
//  CaptchaImageView.swift
//  IP13_Captcha
//
//  Created by Rai, Rhea on 3/20/23.
//

import UIKit

class CaptchaImageView: UIImageView, Shakeable {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

    
    var correct: Bool = false
    /*
    let tap = UITapGestureRecognizer(target: CaptchaImageView.self, action: #selector(CaptchaImageView.imgTap))
    CaptchaImageView.addGestureRecognizer(tap)
    self.isUserInteractionEnabled = true
    */
    //inherited implementation from uiimageview
    func shake() {
            let animation = CABasicAnimation(keyPath: "position")
            
            animation.duration     = 0.05
            animation.repeatCount  = 3
            animation.autoreverses = true
            animation.fromValue    = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
            animation.toValue      = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
            
            self.layer.add(animation, forKey: "position")
        }

    /*
    @objc func imgTap() {
        print("tapped!")
    }
    */
    
    /* source: https://stackoverflow.com/questions/31082866/how-to-use-uigesturerecognizerdelegate
    
     //this one doesn't work tho
     
     func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print("tapped?")
        return true
    }
    */
    
    
    
}

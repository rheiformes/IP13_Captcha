//
//  ViewController.swift
//  IP13_Captcha
//
//  Created by Rai, Rhea on 3/20/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var capView1: CaptchaImageView!
    @IBOutlet var capView2: CaptchaImageView!
    @IBOutlet var capView3: CaptchaImageView!
    @IBOutlet var capView4: CaptchaImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func resetView() {
        shake()
        setImageViews()
    }
    
    func shake() {
        
    }
    
    func setImageViews() {
        pickCorrectRandomly()
        loadImages()
    }
    
    func pickCorrectRandomly() {
        
    }
    func loadImages() {
        
    }
    
    //TODO: change this to use UITapGestureRecognizer since UIImageViews don't default respond to user interaction
    @IBAction func userSelected(sender: CaptchaImageView) {
        //verify
        if(sender.correct) {
            goToTransition()
        }
        else {
            resetView()
        }
    }
    
    func goToTransition() {
        
    }
    
    
    
    

}


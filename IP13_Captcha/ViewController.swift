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
    
    var capImgGrid : [CaptchaImageView] = []
    //var imgNamesFromDirectory: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialView()
    }

    func initialView() {
        capImgGrid = [capView1, capView2, capView3, capView4]
        setNewImageViews()
    }
    
    func resetView() {
        shakeImages()
        setNewImageViews()
    }
    
    func shakeImages() {
        for cv in self.capImgGrid {
            cv.shake()
        }
    }
    
    func setNewImageViews() {
        //pickCorrectRandomly()
        loadImages()
    }
    
    
    
    /* used this for help loading assets syntax: https://www.hackingwithswift.com/read/1/2/listing-images-with-filemanager
        https://www.hackingwithswift.com/books/ios-swiftui/loading-resources-from-your-app-bundle
     
     */
    
    func loadImages() {
        let newNames:[String] = getNewImgNames()
        let randIndexCorrect = Int.random(in: 0...self.capImgGrid.count-1)
        
        for i in 0...self.capImgGrid.count-1 {
            capImgGrid[i].image = UIImage(newNames[i]) //TODO: figure out how to properly load this
            if (i==randIndexCorrect) {
                capImgGrid[i].correct = true
            }
            else {
                capImgGrid[i].correct = false
            }
        }
        
        
        
        
        
    }
    
    /*
     [FIXED: note - REMEMBER TO USE THE CORRECT SLASHES, /, NOT \, to get the files]
     TODO: figure out why directory isn't pulling up
     */
    
    func getNewImgNames() -> [String] {
        let fm = FileManager.default
        let path = (Bundle.main.resourcePath!) + "/Captcha files/Images" //THIS!! USE / not \
        let directory = try! fm.contentsOfDirectory(atPath: path)
        var newNames: [String] = []
        while newNames.count < capImgGrid.count {
            let randIndex = Int.random(in: 0...directory.count-1)
            if !newNames.contains(directory[randIndex]) {
                newNames.append(directory[randIndex])
            }
            
        }
        return newNames
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


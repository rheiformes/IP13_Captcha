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
    
    @IBOutlet var keyLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialView()
        setImgGestures()
    }

    func initialView() {
        capImgGrid = [capView1, capView2, capView3, capView4]
        setNewImageViews()
    }
    
    func resetView() {
        shakeImages()
        setNewImageViews()
    }
    
    func setImgGestures() {
        for img in self.capImgGrid {
            let tap = UITapGestureRecognizer(target: self, action: #selector(imgTapped))
//            print("set + \(img)")
            img.addGestureRecognizer(tap)
            img.isUserInteractionEnabled = true
        }
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
            let imgName: String = newNames[i]
            capImgGrid[i].image = UIImage(named: imgName) //[DONE 3/24] TODO: figure out how to properly load this
            if (i==randIndexCorrect) {
                capImgGrid[i].correct = true
                
                let suffixStart = imgName.lastIndex(of: ".") //?? (imgName.count - 5)
                self.keyLbl.text = imgName.substring(to: suffixStart!)
                
                
            }
            else {
                capImgGrid[i].correct = false
            }
        }
    }
    
    /*
     [FIXED] TODO: 3/22- figure out why directory isn't pulling up
     3/24: note - REMEMBER TO USE THE CORRECT SLASHES, /, NOT \, to get the files]
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
    
    
    //[DONE] TODO: change this to use UITapGestureRecognizer since UIImageViews don't default respond to user interaction
    

    @objc func imgTapped(_ sender: UITapGestureRecognizer) {
        //verify
        print("tapped!!!!!!!")
        let a = sender.view as! CaptchaImageView
        
        
        if (a.correct) {
            goToTransition()
        }
        else {
            resetView()
        }
    }
    
    func goToTransition() {
        
    }
    
    
    
    

}


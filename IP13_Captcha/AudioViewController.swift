//
//  AudioViewController.swift
//  IP13_Captcha
//
//  Created by Rai, Rhea on 3/28/23.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {

    @IBOutlet var playBtn: UIButton!
    
    @IBOutlet var b1: CaptchaButton!
    @IBOutlet var b2: CaptchaButton!
    @IBOutlet var b3: CaptchaButton!
    @IBOutlet var b4: CaptchaButton!
    
    var wrongCount = 0
    var correctKey = ""
    var capBtnGrid: [CaptchaButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
        // Do any additional setup after loading the view.
    }
    

    func initialView() {
        capBtnGrid = [b1, b2, b3, b4]
        loadAudios()
    }
    
    func resetView() {
        shakeButtons()
        loadAudios()
    }
    
    func shakeButtons() {
        for btn in self.capBtnGrid {
            btn.shake()
        }
    }
    
    func loadAudios() {
        let newNames:[String] = getNewAudioNames()
        print(newNames)
        let randIndexCorrect = Int.random(in: 0...self.capBtnGrid.count-1)
        
        for i in 0...self.capBtnGrid.count-1 {
            let audioName: String = newNames[i]
            
            
            let start = audioName.index(audioName.firstIndex(of: "_")!, offsetBy: 1)
            let end = audioName.index(audioName.lastIndex(of: ".")!, offsetBy: 0)
            let btnTitle = String(audioName[start..<end])
            capBtnGrid[i].setTitle(btnTitle, for: .normal)
            
            if (i==randIndexCorrect) {
                capBtnGrid[i].correct = true
                self.correctKey = audioName
            }
            else {
                capBtnGrid[i].correct = false
            }
        }
    }

    func getNewAudioNames() -> [String] {
        let fm = FileManager.default
        let path = (Bundle.main.resourcePath!) //THIS!! USE / not \
        let directory = try! fm.contentsOfDirectory(atPath: path)
        var newNames: [String] = []
        while newNames.count < capBtnGrid.count {
            let randIndex = Int.random(in: 0...directory.count-1)
            if directory[randIndex].hasSuffix(".wav") && !newNames.contains(directory[randIndex]) {
                newNames.append(directory[randIndex])
            }
            
        }
        return newNames
    }
    
    
    //[DONE] TODO: change this to use UITapGestureRecognizer since UIImageViews don't default respond to user interaction
    @IBAction func initialAudioSamplePlayed(_ sender: Any) {
//        var player: AVAudioPlayer = nil
        print("here!")
//        let url = Bundle.main.url(forResource: self.correctKey, withExtension: "wav")
//        player = try! AVAudioPlayer(contentsOf: url!)
//        player.play()
        print(self.correctKey)
    
        //let path = (Bundle.main.resourcePath!) + "/Captcha files/Sounds/" + self.correctKey
        //let path = Bundle.main.resourcePath! + self.correctKey
        
        let url = Bundle.main.url(forResource: self.correctKey.replacingOccurrences(of: ".wav", with: ""), withExtension: "wav")
        //let myURL: URL
        let player = try! AVAudioPlayer(contentsOf:  url!) //URL(fileURLWithPath: path))
      
        
        //let directory = try! fm.contentsOfDirectory(atPath: path)
//       let url = Bundle.main.url(forResource: notesIndexed[noteTag], withExtension: "wav")
//        player = try! AVAudioPlayer(contentsOf: path + "/" + self.correctKey)
        //player.prepareToPlay()
        player.play() //TODO: fix this part....runs but doesn't play?
    }
    
    @IBAction func buttonPressed(_ sender: CaptchaButton) {
        if (sender.correct) {
            performSegue(withIdentifier: "correctAudio", sender: self)
        }
        else {
            wrongCount += 1
            if wrongCount >= 2 {
                performSegue(withIdentifier: "wrongTwiceAudio", sender: self)
            }
            else {
                resetView()
            }
        }
    }
    

}

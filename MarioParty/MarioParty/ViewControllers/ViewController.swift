//
//  ViewController.swift
//  MarioParty
//
//  Created by Dalal Alhazeem on 3/24/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

var selectedPlayer = Player(name: "Mario")
var bombSoundEffect: AVAudioPlayer?

class ViewController: UIViewController {
   
    @IBOutlet weak var playerImageView: UIImageView!
    var playerSoundEffect: AVAudioPlayer?
    var backgroundMusic: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //nextButton.isUserInteractionEnabled = false
        playMusic(musicName: "BG.wav")
        
    }
    
    

    func playMusic(musicName: String){
       let path = Bundle.main.path(forResource: musicName, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }

    }

    @IBAction func randomPlayer(_ sender: Any) {
        let randomPlayer = players.randomElement()!
        playerImageView.image = UIImage(named: randomPlayer.name)
        playMusic(musicName: randomPlayer.musicName())
       selectedPlayer = randomPlayer
        
    
}


}

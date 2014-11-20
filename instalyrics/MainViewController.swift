//
//  MainViewController.swift
//  instalyrics
//
//  Created by Manuel de la Mata on 20/11/2014.
//  Copyright (c) 2014 MMS. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, SongLogicsDelegate {

    var songLogics: SongLogics = SongLogics()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.songLogics.delegate = self
    }

    func processCurrentSong(){
        self.songLogics.updateCurrentSong()
    }
    
    func updateUI(){
        
        self.titleLabel.text = self.songLogics.currentSong?.title
        self.artistLabel.text = self.songLogics.currentSong?.artist
    }
    
    
    // MARK: - SongLogicsDelegate methods
    
    func songDidChange() {
        self.updateUI()
    }
}


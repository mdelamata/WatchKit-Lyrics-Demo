//
//  MainViewController.swift
//  instalyrics
//
//  Created by Manuel de la Mata on 20/11/2014.
//  Copyright (c) 2014 MMS. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, SongLogicsDelegate {

    var songLogics: SongLogics = SongLogics()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    
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
        
        LyricsDAO().getLyricsFor(self.songLogics.currentSong?.title, artist: self.songLogics.currentSong?.artist){ [unowned self] lyrics, error in
            self.lyricsTextView.text = lyrics
        }
    }
    
    
    // MARK: - SongLogicsDelegate methods
    
    func songDidChange() {
        self.updateUI()
    }
}


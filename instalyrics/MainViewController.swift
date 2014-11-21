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
    @IBOutlet weak var retryButton: UIButton!
    
    
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
        
        self.downloadLyrics()

    }
    
    func downloadLyrics(){
        
        LyricsDAO().getLyricsFor(self.songLogics.currentSong?.title, artist: self.songLogics.currentSong?.artist){ [unowned self] lyrics, error in
            self.lyricsTextView.text = lyrics
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.retryButton.transform = CGAffineTransformIdentity
            })
        }
    }
    
    
    // MARK: - IBAction methods

    @IBAction func retryButtonPressed(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.retryButton.transform = CGAffineTransformMakeScale(0, 0)
        })
        self.downloadLyrics()
    }
    
    // MARK: - SongLogicsDelegate methods
    
    func songDidChange() {
        self.updateUI()
    }
}


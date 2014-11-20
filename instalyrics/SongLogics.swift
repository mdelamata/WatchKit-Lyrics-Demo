//
//  SongLogics.swift
//  instalyrics
//
//  Created by Manuel de la Mata on 20/11/2014.
//  Copyright (c) 2014 MMS. All rights reserved.
//

import UIKit
import MediaPlayer

protocol SongLogicsDelegate{
    func songDidChange()
}

class SongLogics: NSObject {
    
    var delegate : SongLogicsDelegate?
    var itemChangedObserver : AnyObject?
    var playbackStatusChangedObserver : AnyObject?

    var iPodMusicPlayer : MPMusicPlayerController!
    
    var currentSong : Song?
    
    
    override init(){
        super.init()
        self.iPodMusicPlayer = MPMusicPlayerController.iPodMusicPlayer()
        self.addObservers()
    }
    
    deinit{
        self.removeObservers()
    }
        
    func updateCurrentSong(){
        
        self.currentSong = Song()
        
        if let item = MPMusicPlayerController.iPodMusicPlayer().nowPlayingItem{
            self.currentSong?.parseMediaPlayerItem(item)
        }
        println("reproducing \(self.currentSong?.songDescription())")
    }
    
    
    func addObservers(){
        
        self.itemChangedObserver = NSNotificationCenter.defaultCenter().addObserverForName(MPMusicPlayerControllerNowPlayingItemDidChangeNotification, object: self.iPodMusicPlayer, queue: NSOperationQueue.mainQueue(), usingBlock: { [unowned self] (notification) -> Void in
            
            self.updateCurrentSong()
            if let udelegate = self.delegate{
                udelegate.songDidChange()
            }
            
        })
        
        self.playbackStatusChangedObserver = NSNotificationCenter.defaultCenter().addObserverForName(MPMusicPlayerControllerPlaybackStateDidChangeNotification, object: self.iPodMusicPlayer, queue: NSOperationQueue.mainQueue(), usingBlock: { [unowned self] (notification) -> Void in
            
        })
        
        self.iPodMusicPlayer.beginGeneratingPlaybackNotifications()
    }
    
    func removeObservers(){
        NSNotificationCenter.defaultCenter().removeObserver(self.itemChangedObserver!, name: MPMusicPlayerControllerNowPlayingItemDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self.playbackStatusChangedObserver!, name: MPMusicPlayerControllerPlaybackStateDidChangeNotification, object: nil)
    }

}


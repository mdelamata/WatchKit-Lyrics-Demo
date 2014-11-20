//
//  Song_Extras.swift
//  instalyrics
//
//  Created by Manuel de la Mata on 20/11/2014.
//  Copyright (c) 2014 MMS. All rights reserved.
//

import UIKit
import MediaPlayer

extension Song {
    
    func parseMediaPlayerItem(item: MPMediaItem!){
        self.title = item.valueForProperty(MPMediaItemPropertyTitle) as NSString?
        self.album = item.valueForProperty(MPMediaItemPropertyAlbumTitle) as NSString?
        self.artist = item.valueForProperty(MPMediaItemPropertyArtist) as NSString?
        self.genre = item.valueForProperty(MPMediaItemPropertyGenre) as NSString?
        self.composer = item.valueForProperty(MPMediaItemPropertyComposer) as NSString?
//        self.duration = item.valueForProperty(MPMediaItemPropertyPlaybackDuration) as Int
    }

    func songDescription() -> String? {
        return  self.titleSong() + " - " + self.artistSong()
    }
    
    func titleSong() -> String!{
        if let title = self.title {
            return title
        }else{
            return ""
        }
    }
    
    func artistSong() -> String!{
        if let title = self.artist {
            return title
        }else{
            return ""
        }
    }
    
    
}
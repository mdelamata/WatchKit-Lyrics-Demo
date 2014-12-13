//
//  Song.swift
//  instalyrics
//
//  Created by Manuel de la Mata on 20/11/2014.
//  Copyright (c) 2014 MMS. All rights reserved.
//

import UIKit

class Song: NSObject {
   
    var title : String?
    var album : String?
    var artist : String?
    var composer : String?
    var genre : String?
    var duration : Int?
    
    
    convenience init(title: String, artist: String) {
        self.init()
        self.title = title
        self.artist = artist
    }

}

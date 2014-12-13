//
//  InterfaceController.swift
//  instalyrics WatchKit Extension
//
//  Created by Manuel de la Mata on 13/12/2014.
//  Copyright (c) 2014 MMS. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var lyricsLabel: WKInterfaceLabel!
    

    override func willActivate() {
        super.willActivate()
        
        self.requestCurrentSong()
        self.prepareMenu()
        
    }

    func prepareMenu(){
        self.addMenuItemWithImage(UIImage(named: "restartIcon")!, title: "Reload", action: "requestCurrentSong")
    }

    func requestCurrentSong(){
        
        var command : String = WatchKitCommand.requestLyrics.rawValue as String
        
        WKInterfaceController.openParentApplication(["command" : command], reply: { [unowned self](infoDict, error) -> Void in
            self.updateInterface(infoDict)
        })
    }
    
    func updateInterface(infoDict: [NSObject : AnyObject]){
                
        self.titleLabel.setText( infoDict["title"] as? String)
        self.lyricsLabel.setText( infoDict["lyrics"] as? String)
    }
    

    
}

//
//  MainViewController.swift
//  instalyrics
//
//  Created by Manuel de la Mata on 20/11/2014.
//  Copyright (c) 2014 MMS. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, SongLogicsDelegate {

    var UIApplicationDidBecomeActiveNotificationObserver : AnyObject?
    var songLogics: SongLogics = SongLogics()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.songLogics.delegate = self
        self.addObservers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewWillAppear(animated: Bool) {

    }
    
    func addObservers(){
        self.UIApplicationDidBecomeActiveNotificationObserver = NSNotificationCenter.defaultCenter().addObserverForName(UIApplicationDidBecomeActiveNotification, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: { [unowned self] (notification) -> Void in
            self.processCurrentSong()
        })
    }
    
    func removeObservers(){
        NSNotificationCenter.defaultCenter().removeObserver(self.UIApplicationDidBecomeActiveNotificationObserver!, name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    func processCurrentSong(){
        
        self.songLogics.printCurrentSong()


    }
    
    
    // MARK: - SongLogicsDelegate methods
    func songDidChange() {
        self.processCurrentSong()

    }
}


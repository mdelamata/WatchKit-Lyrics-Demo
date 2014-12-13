//
//  LyricsDAO.swift
//  instalyrics
//
//  Created by Manuel de la Mata on 20/11/2014.
//  Copyright (c) 2014 MMS. All rights reserved.
//

import UIKit
import Alamofire

let apihost = "http://api.chartlyrics.com"

class LyricsDAO {
    
    func getLyricsFor(title: String?, artist: String?, completion: ((String?, NSError?) -> ())?){
        
        var url = apihost + "/apiv1.asmx/SearchLyricDirect?artist=\(artist!)&song=\(title!)"
        
        var escapedAddress = url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        
        println(">>>>>> " + escapedAddress!)
        
        Alamofire.request(.GET, escapedAddress!, parameters: nil)
            .responseString { (request, response, string, error) in
                
                if let responseString = string {
                    
                    let startRange  = responseString.rangeOfString("<Lyric>")
                    let endRange  = responseString.rangeOfString("</Lyric>")

                    if startRange != nil && endRange != nil {
                        let startIndex = advance(startRange!.startIndex, 7)
                        let endIndex = advance(endRange!.startIndex, 0)
                        
                        let goodRange = startIndex..<endIndex
                        completion?(responseString.substringWithRange(goodRange), nil)

                    }else{
                        completion?(nil, nil)
                    }
                }
        }
    }
}

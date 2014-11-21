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
            
            .response { (request, response, data, error) in
//                let xml = SWXMLHash.parse(data as NSData)
//                println(xml["GetLyricResult"]["Lyric"].element?.text)
//                completion?(xml["GetLyricResult"]["Lyric"].element?.text, nil)

            }
            
            .responseString { (request, response, string, error) in
                
                println(string)
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
                
                
//                let data = string!.dataUsingEncoding(NSUTF8StringEncoding)
//                var parseError: NSError?
//                
//                if let uData = data{
//
//
//                    
//
//                    let xml = SWXMLHash.parse(uData)
//                    
//                    println(xml["GetLyricResult"]["Lyric"].element?.text)
//                    completion?(xml["GetLyricResult"]["Lyric"].element?.text, nil)
//
//                    if let xmlDoc = AEXMLDocument(xmlData: uData , error: &parseError) {
//                        //println(xmlDoc.rootElement["Lyric"].value)
//
//                        //completion?(xmlDoc.rootElement["Lyric"].value, nil)
//                    }
//                }
//                
//                if parseError != nil || error != nil {
//                    completion?(nil, error)
//                }
        }
    }
}


// Lyricsnmusic
////let apihost = "http://api.lyricsnmusic.com"
//
//var url = apihost + "/songs"
//
//var params = Dictionary<String,AnyObject>()
//params["api_key"] = "19e19e90774fc0694f9c6af681d772"
//params["track"] = title!
//params["artist"] = artist!
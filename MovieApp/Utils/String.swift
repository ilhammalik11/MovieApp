//
//  String.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import Foundation

public func checkNull(string:String?)->String {
    
    if string != nil {
        if let data = string {
            return data
        }
    }
    return ""
}

extension String {
    
    func convertDateString() -> String? {
        return convert(dateString: self, fromDateFormat: "yyyy-MM-dd", toDateFormat: "MMM d, yyyy")
    }

    func convert(dateString: String, fromDateFormat: String, toDateFormat: String) -> String? {
        
        let fromDateFormatter = DateFormatter()
        fromDateFormatter.dateFormat = fromDateFormat
        
        if let fromDateObject = fromDateFormatter.date(from: dateString) {
            
            let toDateFormatter = DateFormatter()
            toDateFormatter.dateFormat = toDateFormat
            
            let newDateString = toDateFormatter.string(from: fromDateObject)
            return newDateString
        }
        return nil
    }
}


public func urlString(string:String?)->String {
    if string != nil {
        return string!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    return ""
}

public  func youtubeThumb(path:String)->URL?{
     if let url = URL(string: youtubeThumb+path+"/0.jpg"){
         return url
     }
     return nil
 }
 
 
 public func youtubeURL(path:String)->URL?{
     if let url = URL(string: youtubeLink+path){
         return url
     }
     return nil
 }

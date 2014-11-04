//
//  WordWrapper.swift
//  WordWrapper
//
//  Created by lihui on 14/11/4.
//  Copyright (c) 2014年 lihui. All rights reserved.
//

import Cocoa

class WordWrapper {
    class func wrap(string: String, _ column : Int) -> String {
        
        if countElements(string) <= column {
            return string
        }
        
        var remaining = string
        var result = ""
        do {
            var index = advance(remaining.startIndex, column)
            
            let spaceRange = string.rangeOfString(" ", options: .BackwardsSearch, range: Range(start: string.startIndex, end: advance(index, 1)))
            if let firstIndex = spaceRange {
                index = firstIndex.startIndex
            }
            result += remaining.substringToIndex(index) + "\n"
            
            remaining = remaining.substringFromIndex(index)
            remaining = remaining.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        } while countElements(remaining) > column
        
        if countElements(remaining) > 0 {
            result += remaining
        } else {
            result = result.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
        }
        
        return result
    }
    
}

//
//  String+utils.swift
//  swift-utils
//
//  Created by Sven Schmidt on 25/11/2014.
//
//

import Foundation


extension String {
    
    public func split() -> [String] {
        let separators = NSCharacterSet(charactersInString: " \t,")
        let parts = self.componentsSeparatedByCharactersInSet(separators)
        return parts.filter { countElements($0) > 0 }
    }
 
    public func urlEncode() -> String? {
        return self.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    }
    
}

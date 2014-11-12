//
//  Observer.swift
//  swift-utils
//
//  Created by Sven Schmidt on 12/11/2014.
//
//

import Foundation


class Observer: NSObject {
    
    var observedObject: NSObject
    var keyPath: String
    var block: Void -> Void
    
    
    init(observedObject: NSObject, keyPath: String, block: Void -> Void) {
        self.observedObject = observedObject
        self.keyPath = keyPath
        self.block = block
        super.init()
        self.observedObject.addObserver(self, forKeyPath: self.keyPath, options: .New, context: nil)
    }
    
    
    deinit {
        self.observedObject.removeObserver(self, forKeyPath: self.keyPath)
    }
    
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == self.keyPath {
            self.block()
        }
    }
    
}
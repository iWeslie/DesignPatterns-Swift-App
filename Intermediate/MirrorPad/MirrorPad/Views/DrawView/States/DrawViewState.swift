//
//  DrawViewState.swift
//  MirrorPad
//
//  Created by Weslie Chen on 2019/7/24.
//  Copyright © 2019 Razeware, LLC. All rights reserved.
//

import UIKit

public class DrawViewState {
    
    // MARK:- Class Properties
    public class var identifier: AnyHashable {
        return ObjectIdentifier(self)
    }
    
    // MARK:- Instance Properties
    public unowned let drawView: DrawView
    
    // MARK:- Object Lifecycle
    public init(drawView: DrawView) {
        self.drawView = drawView
    }
    
    // MARK:- Actions
    public func animate() { }
    public func copyLines(from source: DrawView) { }
    public func clear() { }
    
    public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { }
    public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) { }
    
    // MARK:- State Management
    @discardableResult internal func transitionToState(matching identifier: AnyHashable) -> DrawViewState {
        let state = drawView.states[identifier]!
        drawView.currentState = state
        return state
    }
}

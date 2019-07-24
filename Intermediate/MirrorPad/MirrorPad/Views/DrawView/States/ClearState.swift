//
//  ClearState.swift
//  MirrorPad
//
//  Created by Weslie Chen on 2019/7/24.
//  Copyright © 2019 Razeware, LLC. All rights reserved.
//

import UIKit

public class ClearState: DrawViewState {
    public override func clear() {
        drawView.lines = []
        drawView.layer.sublayers?.removeAll()
        transitionToState(matching: AcceptInputState.identifier)
    }
}

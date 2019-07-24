//
//  CopyState.swift
//  MirrorPad
//
//  Created by Weslie Chen on 2019/7/24.
//  Copyright © 2019 Razeware, LLC. All rights reserved.
//

import UIKit

public class CopyState: DrawViewState {
    public override func copyLines(from source: DrawView) {
        drawView.layer.sublayers?.removeAll()
        drawView.lines = source.lines.deepCopy()
        drawView.lines.forEach { drawView.layer.addSublayer($0) }
        transitionToState(matching: AcceptInputState.identifier)
    }
}

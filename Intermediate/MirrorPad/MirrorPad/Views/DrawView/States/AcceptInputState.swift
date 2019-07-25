//
//  AcceptInputState.swift
//  MirrorPad
//
//  Created by Weslie Chen on 2019/7/24.
//  Copyright © 2019 Razeware, LLC. All rights reserved.
//

import UIKit

public class AcceptInputState: DrawViewState {
    
    public override func animate() {
        let animationState = transitionToState(matching: AnimateState.identifier)
        animationState.animate()
    }
    
    public override func clear() {
        let clearState = transitionToState(matching: ClearState.identifier)
        clearState.clear()
    }
    
    public override func copyLines(from source: DrawView) {
        let copyState = transitionToState(matching: CopyState.identifier)
        copyState.copyLines(from: source)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: drawView) else {
            return
        }
        let line = LineShape(color: drawView.lineColor, width: drawView.lineWidth, startPoint: point)
        addLine(line)
        
        drawView.multicastDelegate.invokeDelegates {
            $0.drawView(drawView, didAddLine: line)
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: drawView) else {
            return
        }
        addPoint(point)
        
        drawView.multicastDelegate.invokeDelegates {
            $0.drawView(drawView, didAddPoint: point)
        }
        
    }
    
    private func addLine(_ line: LineShape) {
        drawView.lines.append(line)
        drawView.layer.addSublayer(line)
    }
    
    private func addPoint(_ point: CGPoint) {
        drawView.lines.last?.addPoint(point)
    }
}


extension AcceptInputState {
    public override func drawView(_ source: DrawView, didAddLine line: LineShape) {
        let newLine = line.copy() as LineShape
        addLine(newLine)
    }
    
    public override func drawView(_ source: DrawView, didAddPoint point: CGPoint) {
        addPoint(point)
    }
}

//
//  MinimalProgressBar.swift
//  ProgressKit
//
//  Created by Roland Schemers on 5/9/16.
//  Copyright © 2016 Kauntey Suryawanshi. All rights reserved.
//

import Foundation
import Cocoa

public class MinimalProgressBar: DeterminateAnimation {

    var progressLayer = CAShapeLayer()

    @IBInspectable public var borderColor: NSColor = NSColor.blackColor() {
        didSet {
            notifyViewRedesigned()
        }
    }

    override func notifyViewRedesigned() {
        super.notifyViewRedesigned()
        progressLayer.backgroundColor = foreground.CGColor
    }

    override func configureLayers() {
        super.configureLayers()
        progressLayer.frame = bounds
        progressLayer.backgroundColor = foreground.CGColor
        layer?.addSublayer(progressLayer)
    }

    override func updateProgress() {
        CATransaction.begin()
        if animated {
            CATransaction.setAnimationDuration(0.5)
        } else {
            CATransaction.setDisableActions(true)
        }
        let timing = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        CATransaction.setAnimationTimingFunction(timing)
        progressLayer.frame.size.width = bounds.width * progress
        CATransaction.commit()
    }
}
